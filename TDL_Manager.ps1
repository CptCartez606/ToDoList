. .\Classes\TDL_Class.ps1
. .\Classes\TDL_Menu_Class.ps1

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
    $inp = CheckInput (4)

        switch ($inp)
        {
            1 #Add Item
            {
                $tdl.AddItem()
            }
            2 #Remove Item
            {
                ClearNPrint
                $inputRemove = CheckInput($tdl.GetCount())
                $tdl.RemoveItem($inputRemove)
                cmd /c pause         
            }
            3 #Print
            {
                ClearNPrint
                cmd /c pause #Press any key to continue ...
            }
            4 #Finish
            {
                Write-Host "Finished." 
                $menu.SetMenuFlag($true)
            }
        }
}
function CheckInput($limit)
{
    $flag = $false

        while(!$flag)
        {
            $message = "Please enter a number between 1 and " + $limit

            try {
                [int]$userInput = Read-Host -Prompt $message
            }
            catch {
                "Error: Invalid entry! Try again"
                [int]$userInput = 0
            }

            $gtbool = $userInput -gt $limit
            $ltbool = $userInput -lt 1

            if($gtbool -Or $ltbool)
            {
                Write-Host "Error: Number out of range"
            }
            else
            {
                $flag = $true
            }
        }
        return $userInput
}
function Remove
{
    Clear-Host
    $tdl.PrintList()

    $flag = $false


        while(!$flag)
        {
            [int]$userInput = Read-Host -Prompt "Enter the number you wish to delete from the list"

            $intbool = $userInput -isNot [System.Int32]
            $gtbool = $userInput -gt $tdl.GetCount()
            $ltbool = $userInput -lt 1

            if($intbool -Or $gtbool -Or $ltbool)
            {
                Write-Host "Please enter a number between 1 and " ($tdl.GetCount())
                Write-Host $userInput " " $tdl.GetCount() "Stringbool: " $stringbool "Gtbool:" $gtbool "Lebool:" $ltbool
            }
            else 
            {
                $tdl.RemoveItem($userInput)
                
                $flag = $true
            }
        }

        cmd /c pause
}
function ClearNPrint
{
    Clear-Host
    $tdl.PrintList()
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