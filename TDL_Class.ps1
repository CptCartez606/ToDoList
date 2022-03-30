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
        $userInput = Read-Host -Prompt "Add to list: "
        $this.List += $userInput
    }
    [void]RemoveItem()
    {
        Write-Host "Removing..."
        $this.List.RemoveAt($this.List.Count)
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