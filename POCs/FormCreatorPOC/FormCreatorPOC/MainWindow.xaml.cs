using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml;
using System.Xml.Serialization;
using FormCreatorPOC.Models;
using Microsoft.Win32;

namespace FormCreatorPOC
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, INotifyPropertyChanged
    {
        private List<DependencyObject> _hitResultsList = new List<DependencyObject>();
        private Point _currentlyDraggedMouseOffset;
        private UIElement _currentlyDragged;
        private ContentControl _selectedControl = new ContentControl();
        public event PropertyChangedEventHandler PropertyChanged;
        private double dragOrigin = 0;
        private double defaultWidth = 200;
        private double defaultHeight = 25;
        private Point relativePoint;

        public ContentControl SelectedControl
        {
            get { return this._selectedControl; }
            set
            {
                this._selectedControl = value;
                PropertyChanged(this, new PropertyChangedEventArgs("SelectedControl"));
            }
        }

        public MainWindow()
        {
            DataContext = this;
            InitializeComponent();
            this.PropertiesBar.DataContext = SelectedControl;
            PropertyChanged(this, new PropertyChangedEventArgs("PropertiesBar"));
            InitializeToolbox();
        }

        private void InitializeToolbox()
        {

            this.ToolboxControls = new ObservableCollection<UIElement>();
            Label lbl = new Label();
            lbl.Content = "Label";
            ToolboxControls.Add(lbl);

            Button btn = new Button();
            btn.Content = "Button";
            btn.Height = defaultHeight;
            ToolboxControls.Add(btn);

            PropertyChanged(this, new PropertyChangedEventArgs("ToolboxControls"));
        }

        public ObservableCollection<UIElement> ToolboxControls { get; set; }

        private void Window_PreviewMouseMove(object sender, MouseEventArgs e)
        {
            if (_currentlyDragged != null)
            {
                var mousePos = e.GetPosition(this);
                _currentlyDragged.RenderTransform = new TranslateTransform(mousePos.X - _currentlyDraggedMouseOffset.X, mousePos.Y - _currentlyDraggedMouseOffset.Y);
            }
        }

        private void Window_PreviewMouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (_currentlyDragged is Button)
            {
                Button b = new Button();
                b.Content = "Button";
                ToolboxControls[1] = b;
            }
            else if (_currentlyDragged is Label)
            {
                Label l = new Label();
                l.Content = "Label";
                ToolboxControls[0] = l;
            }

            if (_currentlyDragged != null && dragOrigin > canvas.Width)
            {
                UIElement draggedCopy = XamlReader.Parse(XamlWriter.Save(_currentlyDragged)) as UIElement;
                draggedCopy.RenderTransform = null;
                (draggedCopy as Control).Name = "Control" + this.GetTimeStamp();
                draggedCopy.MouseLeftButtonDown += DroppedControl_MouseDown;
                canvas.Children.Add(draggedCopy);

                if (_currentlyDragged is Button)
                {
                    (draggedCopy as Control).Width = defaultWidth;
                    (draggedCopy as Control).Height = defaultHeight;
                }

                draggedCopy.SetValue(Canvas.LeftProperty, e.GetPosition(canvas).X - relativePoint.X);
                draggedCopy.SetValue(Canvas.TopProperty, e.GetPosition(canvas).Y - relativePoint.Y);
            }
            else if (_currentlyDragged != null)
            {
                _currentlyDragged.RenderTransform = null;
                _currentlyDragged.SetValue(Canvas.LeftProperty, e.GetPosition(canvas).X - relativePoint.X);
                _currentlyDragged.SetValue(Canvas.TopProperty, e.GetPosition(canvas).Y - relativePoint.Y);
            }

            _currentlyDragged = null;
            ReleaseMouseCapture();
        }

        private string GetTimeStamp()
        {
            DateTime now = DateTime.UtcNow;
            return now.Ticks.ToString();
        }

        private void DroppedControl_MouseDown(object sender, MouseButtonEventArgs e)
        {
        }

        private void Window_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Point pt = e.GetPosition((UIElement)sender);
            if (pt.X > 300 && pt.Y > 300)
            {
                return;
            }

            _hitResultsList.Clear();

            VisualTreeHelper.HitTest(this, null,
                new HitTestResultCallback(MyHitTestResult),
                new PointHitTestParameters(pt));

            if (_hitResultsList.Count > 0)
            {
                foreach (DependencyObject d in _hitResultsList)
                {
                    var parent = VisualTreeHelper.GetParent(d);

                    if (parent is UIElement && (parent is Button || parent is Label))
                    {
                        CaptureMouse();

                        if (e.ClickCount == 2)
                        {
                            //this.SelectedControl = (parent as Control);

                            this.SelectedControl.Name = (parent as Control).Name;
                            this.SelectedControl.Content = (parent as ContentControl).Content;
                            //PropertyChanged(this, new PropertyChangedEventArgs("_selectedControl"));
                            PropertyChanged(this, new PropertyChangedEventArgs("PropertiesBar"));

                            return;
                        }

                        dragOrigin = pt.X;
                        this.relativePoint = e.GetPosition(parent as UIElement);
                        _currentlyDragged = parent as UIElement;

                        if (_currentlyDragged.RenderTransform is TranslateTransform)
                        {
                            _currentlyDraggedMouseOffset.X = e.GetPosition(this).X - ((TranslateTransform)_currentlyDragged.RenderTransform).X;
                            _currentlyDraggedMouseOffset.Y = e.GetPosition(this).Y - ((TranslateTransform)_currentlyDragged.RenderTransform).Y;
                        }
                        else
                        {
                            _currentlyDraggedMouseOffset.X = pt.X;
                            _currentlyDraggedMouseOffset.Y = pt.Y;
                        }

                        return;
                    }
                }
            }
            _currentlyDragged = null;
        }

        // Return the result of the hit test to the callback. 
        public HitTestResultBehavior MyHitTestResult(HitTestResult result)
        {
            _hitResultsList.Add(result.VisualHit);
            return HitTestResultBehavior.Continue;
        }

        private void TextBox_LostFocus(object sender, RoutedEventArgs e)
        {
            var element =
                this.canvas.Children.OfType<ContentControl>().FirstOrDefault(c => c.Name == this.SelectedControl.Name);
            int index = canvas.Children.IndexOf(element);
            (canvas.Children[index] as ContentControl).Content = (sender as TextBox).Text;
        }

        private void menuItemFileOpen_Click(object sender, RoutedEventArgs e)
        {
            Template template = GetTemplate();
            canvas.Children.Clear();

            foreach (var templControl in template.Controls)
            {
                ContentControl control = new ContentControl();
                if (templControl.Type == typeof(Button).Name)
                {
                    control = new Button();
                }
                else if (templControl.Type == typeof(Label).Name)
                {
                    control = new Label();
                }

                control.Name = templControl.Name;
                control.Content = templControl.Title;
                control.SetValue(LeftProperty, templControl.X);
                control.SetValue(TopProperty, templControl.Y);
                canvas.Children.Add(control);
            }
        }

        private Template GetTemplate()
        {
            OpenFileDialog dialog = new OpenFileDialog();
            dialog.Filter = "XML file (*.xml) | *.xml";
            Template template = new Template();
            if (dialog.ShowDialog() == true)
            {
                template.Name = dialog.SafeFileName;

                XmlSerializer serializer = new XmlSerializer(template.GetType());
                using (FileStream fs = new FileStream(dialog.FileName, FileMode.Open))
                {
                    template = serializer.Deserialize(fs) as Template;
                }
            }

            return template;
        }

        private void menuItemFileSave_Click(object sender, RoutedEventArgs e)
        {
            var canvasControls = canvas.Children.OfType<ContentControl>();
            List<TemplateControl> controls = new List<TemplateControl>();
            foreach (var contentControl in canvasControls)
            {
                controls.Add(new TemplateControl()
                                 {
                                     Name = contentControl.Name,
                                     Title = contentControl.Content.ToString(),
                                     Type = contentControl.GetType().Name,
                                     X = double.Parse(contentControl.GetValue(LeftProperty).ToString()),
                                     Y = double.Parse(contentControl.GetValue(TopProperty).ToString())
                                 });
            }

            Template template = new Template();
            template.Controls = controls;
            SaveTemplate(template);
        }

        private void SaveTemplate(Template template)
        {
            SaveFileDialog dialog = new SaveFileDialog();
            dialog.Filter = "XML file (*.xml) | *.xml";
            if (dialog.ShowDialog() == true)
            {
                template.Name = dialog.SafeFileName;
                XmlSerializer serializer = new XmlSerializer(template.GetType());
                using (FileStream fs = new FileStream(dialog.FileName, FileMode.Create))
                {
                    serializer.Serialize(fs, template);
                }

                MessageBox.Show("File saved successfully");
            }
        }
    }
}
