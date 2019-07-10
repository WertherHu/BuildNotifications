﻿using System;
using System.Windows.Input;

namespace BuildNotifications.ViewModel.Utils
{
    public class DelegateCommand : ICommand
    {
        public DelegateCommand(Action<object> execute, Predicate<object> canExecute = null)
        {
            _execute = execute;
            _canExecute = canExecute;
        }

        public void RaiseCanExecuteChanged()
        {
            CanExecuteChanged?.Invoke(this, EventArgs.Empty);
        }

        public event EventHandler CanExecuteChanged;

        public bool CanExecute(object parameter)
        {
            return _canExecute == null || _canExecute(parameter);
        }

        public void Execute(object parameter)
        {
            _execute(parameter);
        }

        private readonly Predicate<object> _canExecute;
        private readonly Action<object> _execute;
    }
}