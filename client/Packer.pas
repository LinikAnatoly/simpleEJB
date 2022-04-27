unit Packer;

interface

  function GetFileName(Name: String): String;
  function PackFile(InPath, OutPath: String; archiveWay: Integer = 0): Boolean;
  function UnpackFile(InPath, OutPath: String; archiveWay: Integer = 0): Boolean;

const //Способы архивации вложений
  ARCH_JVZLIBMULTIPLE = 0;  //C помощью компонента Delphi JvZlibMultiple
  ARCH_WINRAR         = 1;  //С попощью WinRAR
  ARCH_7ZIP           = 2;  //С помощью 7-Zip
  ARCH_DEFAULT        = 0;  //Способ архивации по умолчанию

  //Места хранения вложений
  //ATTACH_SAVE_DB      = 0;  //База данных EnergyWorkFlow
  //ATTACH_SAVE_FS      = 1;  //Файловая система (строковая константа WFADir)
  //ATTACH_SAVE_FS_DB   = 2;  //Файловая система и База данных EnergyWorkFlow
  //ATTACH_SAVE_DEFAULT = 1;  //Хранение по умолчанию. PRIC-471. 11.03.2014

implementation

uses
  Classes,
  Forms,
  Main,
  ShellAPI,
  SysUtils,
  Windows;

function GetFileName(Name: String): String; //stdcall;
var y, m, d, h, mm, s, ms: Word;

  function AddZero(value: Word): String;
  begin
    if value < 10 then
      Result := '0' + IntToStr(value)
    else
      Result := IntToStr(value);
  end; //function AddZero(value: Word): String;

begin
  DecodeTime(Time, h, mm, s, ms);
  DecodeDate(Date, y, m, d);
  Result := name + '_' +
    AddZero(d) +
    AddZero(m) +
    Copy(IntToStr(y), 3, 2) +
    AddZero(h) +
    AddZero(mm)+
    AddZero(s) +
    AddZero(ms);
end; //function GetFileName(Name: String): String; //stdcall;

function PackFile(InPath, OutPath: String; archiveWay: Integer = 0): Boolean;
  //stdcall;
var files: TStrings;
  si: TStartupInfo;
  p: TProcessInformation;

  function PackFileJvZlibMultiple: Boolean;
  begin //Архивация с помощью компоненты Delphi JvZlibMultiple
    Result := False;
    try
      files := TStringList.Create;
      try
        files.Add(InPath);
        if Assigned(Main.frmMain) then
          Main.frmMain.JvZlibMultiple1.CompressFiles(files, OutPath);
      finally
        files.Free;
      end;
	    Result := True;
    except
      raise;
      Exit;
    end;
  end; //function PackFileJvZlibMultiple: Boolean;

  function PackFileWinRar: Boolean;
  begin //Архивация c попощью WinRAR
    Result := False;
    try
      //ShellExecute(0, PChar('open'),
      //  PChar(ExtractFilePath(Application.ExeName) +
      //  '\WinRAR.exe ' + 'a -r -ep "' + OutPath + '" "' + InPath + '"'),
      //  nil, nil, SW_SHOWMINIMIZED);
      FillChar(Si,SizeOf(Si),0);
      with Si do
        begin
          cb := SizeOf( Si);
          dwFlags := startf_UseShowWindow;
          wShowWindow := SW_HIDE;//SW_SHOWMINIMIZED //SW_SHOWNOACTIVATE
        end;
      Createprocess(nil, PChar(ExtractFilePath(Application.ExeName) +
        '\WinRAR.exe ' + 'a -r -ep "' + OutPath + '" "' + InPath + '"'),
        nil, nil, false, Create_default_error_mode, //CREATE_NEW_CONSOLE
        nil, nil, si, p);
      Waitforsingleobject(p.hProcess, infinite);
	    Result := True;
    except
      //raise;
      Exit;
    end;
  end; //function PackFileWinRar: Boolean;

  function PackFile7z: Boolean;
  begin //Архивация c попощью 7-Zip
    Result := False;
    try
      //ShellExecute(0, PChar('open'),
      //  PChar(ExtractFilePath(Application.ExeName) +
      //  '\7z.exe ' + 'a ' + OutPath + ' ' + ExtractFilePath(InPath) + ' ' +
      //  ExtractFileName(InPath)),
      //  nil, nil, SW_SHOWMINIMIZED);
	    FillChar(Si,SizeOf(Si),0);
      with Si do begin
        cb := SizeOf( Si);
        dwFlags := startf_UseShowWindow;
        wShowWindow := SW_HIDE;//SW_SHOWMINIMIZED //SW_SHOWNOACTIVATE
      end;
      Createprocess(nil, PChar(ExtractFilePath(Application.ExeName) +
        '\7z.exe ' + 'a "' + OutPath + '" "' + InPath + '"'),
        nil, nil, false, Create_default_error_mode, //CREATE_NEW_CONSOLE
        nil, nil, si, p);
      Waitforsingleobject(p.hProcess, infinite);
	    Result := True;
    except
      raise;
      Exit;
    end;
  end; //function PackFile7z: Boolean;

begin
  Result := False;
  case archiveWay of
    ARCH_JVZLIBMULTIPLE: //Архивация Delphi-компонентой JvZlibMultiple
      if not PackFileJvZlibMultiple then
	    Exit;
    ARCH_WINRAR: //Архивация WinRar
      if not PackFileWinRar then //В случае неудачи
	    if not PackFile7z then  //7-Zip-упаковка
		  Exit;
    ARCH_7ZIP: //Архивация c попощью 7-Zip
      if not PackFile7z then
	    Exit;
  end; //case archiveWay of
  Result := true;
end; //function PackFile(...

function UnpackFile(InPath, OutPath: String; archiveWay: Integer = 0): Boolean;
  //stdcall;
var si: TStartupInfo;
  p: TProcessInformation;

  function UnPackFileJvZlibMultiple: Boolean;
  begin
    Result := False;
    try //Деархивация с помощью Delphi-компоненты JvZlibMultiple
      Main.frmMain.JvZlibMultiple1.DecompressFile(InPath,
        ExtractFileDir(OutPath), true);
	    Result := True;
    except
      raise;
      Exit;
    end;
  end; //function UnPackFileJvZlibMultiple: Boolean;

  function UnPackFileWinRar: Boolean;
  begin //Деархивация файла с помощью WinRar
    Result := False;
    try
	    //ShellExecute(0, PChar('open'),
      //  PChar(ExtractFilePath(Application.ExeName) +
      //    '\WinRAR.exe ' + 'e "' + InPath + '" "' +
      //    ExtractFileDir(OutPath) + '"'),
      //  nil, nil, SW_SHOWMINIMIZED);
      FillChar(Si, SizeOf(Si),0);
      with Si do begin
        cb := SizeOf(Si);
        dwFlags := startf_UseShowWindow;
        wShowWindow := SW_HIDE;
      end;
      Createprocess(nil, PChar(ExtractFilePath(Application.ExeName) +
        '\WinRAR.exe ' + 'e "' + InPath + '" "' +
        ExtractFileDir(OutPath) + '"'),
        nil, nil, false, Create_default_error_mode, nil, nil, si, p);
      Waitforsingleobject(p.hProcess, infinite);
	    Result := True;
    except
      //raise;
      Exit;
    end;
  end; //function UnPackFileWinRar: Boolean;

  function UnPackFile7z: Boolean;
  begin //Деархивация c помощью 7-Zip
    Result := False;
    try
	    //ShellExecute(0, PChar('open'),
      //  PChar(ExtractFilePath(Application.ExeName) +
      //  '\7z.exe ' + 'e ' + InPath + ' -o' + ExtractFileDir(OutPath)),
      //  nil, nil, SW_SHOWMINIMIZED);
	    FillChar(Si, SizeOf(Si), 0);
      with Si do
        begin
          cb := SizeOf( Si);
          dwFlags := startf_UseShowWindow;
          wShowWindow := SW_HIDE;
        end;
      Createprocess(nil, PChar(ExtractFilePath(Application.ExeName) +
        '\7z.exe ' + 'e ' + '"' + InPath + '" -o"' + ExtractFileDir(OutPath)
        + '"'), nil, nil, false,
        Create_default_error_mode, //CREATE_NEW_CONSOLE
        nil, nil, si, p);
      Waitforsingleobject(p.hProcess, infinite);
	    Result := True;
    except
      raise;
      Exit;
    end;
  end; //function UnPackFile7z: Boolean;

begin
  Result := False;
  case archiveWay of
    ARCH_JVZLIBMULTIPLE: //Деархивация Delphi-компонентой JvZlibMultiple
      if not UnPackFileJvZlibMultiple then
	      Exit;
    ARCH_WINRAR: //Деархивация c помощью WinRar
      if not UnPackFileWinRar then //В случае неудачи альтернативная
        if not UnPackFile7z then   //7-Zip-распаковка  rar-архива
		  Exit;
	  ARCH_7ZIP: //Деархивация c помощью 7-Zip
      if not UnPackFile7z then
		    Exit;
  end; //case archiveWay of
  Result := True;
end; //function UnpackFile(...

end.
