. .\TDL_Class.ps1
. .\TDL_Menu_Class.ps1

function InitiateTDLList
{
    $global:tdl = [TDL]::new()
    $global:menu = [InputMenu]::new()

    $tdl.FormatList()
    $menu.SetMenuFlag($false)
}
function SelectMenuOption
{
    $menu.ShowMessage()
    $inp = Read-Host -Prompt "Input"

        switch ($inp)
        {
            1 {$tdl.AddItem()}
            2 {$tdl.RemoveItem()} #Not working yet
            3 
            {
                Clear-Host #clear the space for the list to print
                $tdl.GetList()
                cmd /c pause #Press any key to continue ...
            }
            4 {"Remove @."} #TODO...
            5 
            {
                Write-Host "Finished." 
                $menu.SetMenuFlag($true)
            }
        }
}
function StartApplication
{
    # Create objects and set them
    InitiateTDLList
    while(!$menu.GetMenuFlag())
    {
        SelectMenuOption
    }
    
}