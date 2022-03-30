class InputMenu
{
    [bool]$menuFlag

    [void] ShowMessage()
    {
        $OpenMessage = "TODO-List
        1)Add Item
        2)Remove last added item
        3)Print TODO-List
        4)Remove item at selected number
        5)Finish
        "
        write-host $OpenMessage
    }
    [void] SetMenuFlag($bool)
    {
        $this.menuFlag = $bool
    }
    [bool]GetMenuFlag()
    {
        return $this.menuFlag
    }
}