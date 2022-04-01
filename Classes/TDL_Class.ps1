class TDL
{
    [System.Collections.ArrayList]$List = @()

    [void]FormatList()
    {
        $this.List = "Do laundry", "Wash car", "Buy grociers"
    }
    [string]GetList()
    {
        return $this.List
    }
    [string]GetItem($temp)
    {
        return $this.List[$temp]
    }
    [int]GetCount()
    {
        return $this.List.Count
    }
    [void]AddItem()
    {
        $userInput = Read-Host -Prompt "Add to list"
        $this.List += $userInput
    }
    [void]RemoveItem($item)
    {
        $temp = $this.List[$item-1]
        Write-Host "Removing... " $temp
        $this.List.RemoveAt($item-1)        

    }
    [void]PrintList()
    {
        $i = 1

        foreach($Item in $this.list) {
            $itemstr = "{0}) {1}" -f $i, $item
            Write-Host $itemstr
            $i++
        }
    }
}