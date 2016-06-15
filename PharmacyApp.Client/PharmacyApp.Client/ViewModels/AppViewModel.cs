using System.Windows;
using System.Windows.Input;
using PharmacyApp.Client.Behavior;

namespace PharmacyApp.Client.ViewModels
{
    class AppViewModel : ViewModelBase
    {
        public string AppTitle
        {
            get { return "Pharmacy" + '\u2122'; }
        }
        private ViewModelBase _currentViewModel;
        private TemplateDesignerViewModel _templateDesignerViewModel = new TemplateDesignerViewModel();

        public ViewModelBase CurrentViewModel
        {
            get { return _currentViewModel; }
            set { _currentViewModel = value; OnPropertyChanged("CurrentViewModel"); }
        }

        public ICommand NomenclaturesCommand
        {
            get
            {
                return new RelayCommand(nomenclaturesCommand_Execute);
            }
        }

        private void nomenclaturesCommand_Execute(object parameter)
        {
            this.CurrentViewModel = new TemplateDesignerViewModel();
        }
    }
}
