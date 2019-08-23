﻿using BuildNotifications.Resources.Icons;

namespace BuildNotifications.Resources.Global.Navigation.ButtonNavigation
{
    internal interface IButtonNavigationItem
    {
        object Content { get; }
        string DisplayNameTextId { get; }

        IconType IconType { get; }
    }
}