class TDL
{
    [System.Collections.ArrayList]$List = @()

    [void]FormatList()
    {
        $this.List = "Do laundry", "Wash car", "Buy grociers"
    }
    [string]FindList()
    {
        return $this.List
    }
    [void]AddItem()
    {
        $userInput = Read-Host -Prompt "Add to list"
        $this.List += $userInput
    }
    [void]RemoveItem()
    {
        $userInput = Read-Host -Prompt "Enter the number you wish to delete from the list"
        $temp = $this.List[$userInput-1]

        Write-Host "Removing... " $temp
        #Subtract 1 from the count because arrays start at 0
        $this.List.RemoveAt($userInput-1)
    }
    [void]GetList()
    {
        $i = 1

        foreach($Item in $this.list) {
            $itemstr = "{0}) {1}" -f $i, $item
            Write-Host $itemstr
            $i++
        }
    }
}