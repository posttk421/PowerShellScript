# 指定されたディレクトリ配下のファイルに対して、MD5チェックサムを取得する
# 
# 下記ブログを参考に作成
# PowerShell でハッシュ値を計算する(http://blogs.gine.jp/taka/archives/1369)

param($path)

function GetMD5{
    param($fileName)
    
    $stream = New-Object IO.StreamReader $fileName

    # MD5ハッシュ値を計算する
    $md5 = [System.Security.Cryptography.MD5]::Create()
    $hash = $md5.ComputeHash($stream.BaseStream);
    $result = [System.BitConverter]::ToString($hash).Replace("-","").ToLower()

    $result
}

Get-ChildItem $path  | ?{ !$_.PSIsContainer } |
%{
    echo ($_.Name + "`t" + (GetMD5 $_.FullName))
}
