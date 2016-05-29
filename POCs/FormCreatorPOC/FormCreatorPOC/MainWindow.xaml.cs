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
        private List<UIElement> draggedElements;
        public event PropertyChangedEventHandler PropertyChanged;
        private double dragOrigin = 0;

        public MainWindow()
        {
            DataContext = this;
            InitializeComponent();
            InitializeToolbox();
        }

        private void InitializeToolbox()
        {
            this.draggedElements = new List<UIElement>();
            this.ToolboxControls = new ObservableCollection<UIElement>();
            Label lbl = new Label();
            lbl.Content = "Label";
            ToolboxControls.Add(lbl);

            Button btn = new Button();
            btn.Content = "Button";
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
            else if(_currentlyDragged is Label)
            {
                Label l = new Label();
                l.Content = "Label";
                ToolboxControls[0] = l;
            }

            if (_currentlyDragged != null && dragOrigin > canvas.Width)
            {
                UIElement draggedCopy = XamlReader.Parse(XamlWriter.Save(_currentlyDragged)) as UIElement;
                draggedCopy.RenderTransform = null;
                canvas.Children.Add(draggedCopy);
                draggedCopy.SetValue(Canvas.LeftProperty, e.GetPosition(canvas).X);
                draggedCopy.SetValue(Canvas.TopProperty, e.GetPosition(canvas).Y);

            }

            _currentlyDragged = null;
            ReleaseMouseCapture();
        }

        private void Window_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            CaptureMouse();
            Point pt = e.GetPosition((UIElement)sender);
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
                        dragOrigin = pt.X;
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
    }
}
