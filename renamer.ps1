for($true){
$cldir=Read-Host "変更するフォルダのパスを入力してください"
try{
cd $cldir -ErrorAction Stop
}catch{
echo "フォルダが存在しません"
continue
}
$ans=Read-Host $cldir"のファイルをリネームしますか？　y/n"
if($ans -eq "y"){
$add =Read-Host "接頭辞がある場合入力してください"
$ToNatural = { [regex]::Replace($_, '\d+', { $args[0].Value.PadLeft(20) }) } 
ls -File | Sort-Object  $ToNatural | %{$i=1}{$Newname = $add+$i.tostring("000")+$_.Extension; rename-item $_  $Newname; $i++}
$i-=1
echo $i"件のファイルをリネームしました"
             }else{echo "リネームを中止しました"}
$nex=Read-Host "続けてリネームしますか？ y/n"
if($nex -eq "n"){
echo "リネームを終了します"
break
                }
}