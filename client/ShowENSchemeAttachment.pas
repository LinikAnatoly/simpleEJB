
unit ShowENSchemeAttachment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,Grids,
  ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit, ShellAPI, EnergyProController,
  EnergyProController2, ENSchemeAttachmentController, AdvObj ;


type
  TfrmENSchemeAttachmentShow = class(TChildForm)  
  HTTPRIOENSchemeAttachment: THTTPRIO;
    ImageList1: TImageList;
    sgENSchemeAttachment: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    actOpenScheme: TAction;
    tbOpenScheme: TToolButton;
    actNewScheme: TAction;
    tbNewScheme: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENSchemeAttachmentTopLeftChanged(Sender: TObject);
//procedure sgENSchemeAttachmentDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actOpenSchemeExecute(Sender: TObject);
    procedure actNewSchemeExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENSchemeAttachmentShow : TfrmENSchemeAttachmentShow;
 // ENSchemeAttachmentObj: ENSchemeAttachment;
 // ENSchemeAttachmentFilterObj: ENSchemeAttachmentFilter;

  //Возврат имени файла, упаковка-распаковка файлов
  //при помощи функций динамической библиотеки Packer.dll
  //function GetFileName(Name: String): String; stdcall;
  //  external 'Packer.dll' name 'GetFileName';
  //function PackFile(InPath, OutPath: String; archiveWay: Integer = 2): Boolean; stdcall;
  //  external 'Packer.dll' name 'PackFile';
  //function UnpackFile(InPath, OutPath: String; archiveWay: Integer = 2): Boolean; stdcall;
  //  external 'Packer.dll' name 'UnpackFile';

implementation

uses Main, EditENSchemeAttachment, EditENSchemeAttachmentFilter,
  ENSchemeController, Packer;


{$R *.dfm}

var
  //frmENSchemeAttachmentShow : TfrmENSchemeAttachmentShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSchemeAttachmentHeaders: array [1..5] of String =
    ('Код',
    'Пользователь',
    'Комментарий',
    'Дата привязки',
    'Имя и тип вложения');


procedure TfrmENSchemeAttachmentShow.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSchemeAttachmentShow := nil;
  inherited;
end;


procedure TfrmENSchemeAttachmentShow.FormShow(Sender: TObject);
var
  TempENSchemeAttachment: ENSchemeAttachmentControllerSoapPort;
  i: Integer;
  ENSchemeAttachmentList: ENSchemeAttachmentShortList;
  begin
  SetGridHeaders(ENSchemeAttachmentHeaders, sgENSchemeAttachment.ColumnHeaders);
  ColCount:=100;
  TempENSchemeAttachment :=  HTTPRIOENSchemeAttachment as ENSchemeAttachmentControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSchemeAttachmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSchemeAttachmentList := TempENSchemeAttachment.getScrollableFilteredList(ENSchemeAttachmentFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSchemeAttachmentList.list);

  if LastCount > -1 then
     sgENSchemeAttachment.RowCount:=LastCount+2
  else
     sgENSchemeAttachment.RowCount:=2;

   with sgENSchemeAttachment do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSchemeAttachmentList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSchemeAttachmentList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSchemeAttachmentList.list[i].userGen;
        Cells[2,i+1] := ENSchemeAttachmentList.list[i].commentGen;
        if ENSchemeAttachmentList.list[i].attachmentDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENSchemeAttachmentList.list[i].attachmentDate);
        Cells[4,i+1] := ENSchemeAttachmentList.list[i].schemeName + '.' +
          ENSchemeAttachmentList.list[i].schemeExt;
        LastRow:=i+1;
        sgENSchemeAttachment.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSchemeAttachment.Row:=1;
end;

procedure TfrmENSchemeAttachmentShow.sgENSchemeAttachmentTopLeftChanged(Sender: TObject);
var
  TempENSchemeAttachment: ENSchemeAttachmentControllerSoapPort;
  i,CurrentRow: Integer;
  ENSchemeAttachmentList: ENSchemeAttachmentShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSchemeAttachment.TopRow + sgENSchemeAttachment.VisibleRowCount) = ColCount
  then
    begin
      TempENSchemeAttachment :=  HTTPRIOENSchemeAttachment as ENSchemeAttachmentControllerSoapPort;
      CurrentRow:=sgENSchemeAttachment.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSchemeAttachmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSchemeAttachmentList := TempENSchemeAttachment.getScrollableFilteredList(ENSchemeAttachmentFilter(FilterObject),ColCount-1, 100);



  sgENSchemeAttachment.RowCount:=sgENSchemeAttachment.RowCount+100;
  LastCount:=High(ENSchemeAttachmentList.list);
  with sgENSchemeAttachment do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSchemeAttachmentList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSchemeAttachmentList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSchemeAttachmentList.list[i].userGen;
        Cells[2,i+CurrentRow] := ENSchemeAttachmentList.list[i].commentGen;
        if ENSchemeAttachmentList.list[i].attachmentDate = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENSchemeAttachmentList.list[i].attachmentDate);
        Cells[4,i+CurrentRow] := ENSchemeAttachmentList.list[i].schemeName + '.' +
          ENSchemeAttachmentList.list[i].schemeExt;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSchemeAttachment.Row:=CurrentRow-5;
   sgENSchemeAttachment.RowCount:=LastRow+1;
  end;
end;

(*procedure TfrmENSchemeAttachmentShow.sgENSchemeAttachmentDblClick(Sender: TObject);
Var temp : Integer;
begin
  if FormMode = fmNormal then
    begin
      try
        temp:=StrToInt(GetReturnValue(sgENSchemeAttachment, 0));
      except
        on EConvertError do Exit;
      end;
      ModalResult := mrOk;
    end
  else begin
    actViewExecute(Sender);
  end;
end;*)

procedure TfrmENSchemeAttachmentShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i := 1 to sgENSchemeAttachment.RowCount - 1 do
   for j := 0 to sgENSchemeAttachment.ColCount - 1 do
     sgENSchemeAttachment.Cells[j, i] := '';
 FormShow(Sender);
end;

procedure TfrmENSchemeAttachmentShow.actViewExecute(Sender: TObject);
Var TempENSchemeAttachment: ENSchemeAttachmentControllerSoapPort;
begin
  TempENSchemeAttachment :=
    HTTPRIOENSchemeAttachment as ENSchemeAttachmentControllerSoapPort;
  try
    ENSchemeAttachmentObj :=
      TempENSchemeAttachment.getObject(
        StrToInt(sgENSchemeAttachment.Cells[0, sgENSchemeAttachment.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENSchemeAttachmentEdit :=
    TfrmENSchemeAttachmentEdit.Create(Application, dsView);
  try
    frmENSchemeAttachmentEdit.ShowModal;
  finally
    frmENSchemeAttachmentEdit.Free;
    frmENSchemeAttachmentEdit := nil;
  end;
end;

procedure TfrmENSchemeAttachmentShow.actEditExecute(Sender: TObject);
Var TempENSchemeAttachment: ENSchemeAttachmentControllerSoapPort;
begin
  TempENSchemeAttachment :=
    HTTPRIOENSchemeAttachment as ENSchemeAttachmentControllerSoapPort;
  try
    ENSchemeAttachmentObj :=
      TempENSchemeAttachment.getObject(StrToInt(
        sgENSchemeAttachment.Cells[0, sgENSchemeAttachment.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENSchemeAttachmentEdit :=
    TfrmENSchemeAttachmentEdit.Create(Application, dsEdit);
  try
    with frmENSchemeAttachmentEdit do
      begin
        HideControls([spbDocPath, edtDocPath, lblDocPath], False);
        if ShowModal = mrOk then
          UpdateGrid(Sender);
      end;
  finally
    frmENSchemeAttachmentEdit.Free;
    frmENSchemeAttachmentEdit := nil;
  end;
end;

procedure TfrmENSchemeAttachmentShow.actDeleteExecute(Sender: TObject);
Var TempENSchemeAttachment: ENSchemeAttachmentControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSchemeAttachment := HTTPRIOENSchemeAttachment as ENSchemeAttachmentControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSchemeAttachment.Cells[0,sgENSchemeAttachment.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Прикрелённые к конкретному элементу схемы) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSchemeAttachment.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSchemeAttachmentShow.actInsertExecute(Sender: TObject);
Var TempENSchemeAttachment: ENSchemeAttachmentControllerSoapPort;
begin
  TempENSchemeAttachment :=
    HTTPRIOENSchemeAttachment as ENSchemeAttachmentControllerSoapPort;
  ENSchemeAttachmentObj := ENSchemeAttachment.Create;
  try
    if FilterObject = nil then
      begin
        Application.MessageBox(PChar('Схемы не отфильтрованы.'),
          PChar('Внимание!'), MB_ICONWARNING);
        Exit;
      end;
    if ENSchemeAttachment(FilterObject).schemeRef = nil then
      begin
        Application.MessageBox(PChar('Не определён перечень.'),
          PChar('Внимание!'), MB_ICONWARNING);
        Exit;
      end;
    if ENSchemeAttachment(FilterObject).schemeRef.code <> Low(Integer) then
      begin
        ENSchemeAttachmentObj.schemeRef := ENSchemeRef.Create;
        ENSchemeAttachmentObj.schemeRef.code :=
          ENSchemeAttachment(FilterObject).schemeRef.code;
        //ENSchemeAttachmentObj.isPacked := 0;
      end
    else
      begin
        Application.MessageBox(PChar('Не определён код схемы.'),
        PChar('Внимание!'), MB_ICONWARNING);
        Exit;
      end;
    frmENSchemeAttachmentEdit :=
      TfrmENSchemeAttachmentEdit.Create(Application, dsInsert);
    try
      with frmENSchemeAttachmentEdit do
        begin
          dtpAttachmentDate.Checked := True;
          HideControls([spbDocPath, edtDocPath], False);
          if ShowModal = mrOk then
            if ENSchemeAttachmentObj <> nil then
              UpdateGrid(Sender);
        end;
    finally
      frmENSchemeAttachmentEdit.Free;
      frmENSchemeAttachmentEdit := nil;
    end;
  finally
    ENSchemeAttachmentObj.Free;
  end;
end;

procedure TfrmENSchemeAttachmentShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSchemeAttachmentShow.actFilterExecute(Sender: TObject);
begin
{frmENSchemeAttachmentFilterEdit:=TfrmENSchemeAttachmentFilterEdit.Create(Application, dsInsert);
  try
    ENSchemeAttachmentFilterObj := ENSchemeAttachmentFilter.Create;
    SetNullIntProps(ENSchemeAttachmentFilterObj);
    SetNullXSProps(ENSchemeAttachmentFilterObj);

    if frmENSchemeAttachmentFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSchemeAttachmentFilter.Create;
      FilterObject := ENSchemeAttachmentFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSchemeAttachmentFilterEdit.Free;
    frmENSchemeAttachmentFilterEdit:=nil;
  end;}
end;

procedure TfrmENSchemeAttachmentShow.actNoFilterExecute(Sender: TObject);
begin
  {FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);}
end;

procedure TfrmENSchemeAttachmentShow.actOpenSchemeExecute(Sender: TObject);
Var TempENSchemeAttachment: ENSchemeAttachmentControllerSoapPort;
  MS: TMemoryStream;
  vSchemeFile: ArrayOfByte;
  InPath, OutPath: String;
  i: Integer;
  IsFileNamed: Boolean;
begin
  TempENSchemeAttachment :=
    HTTPRIOENSchemeAttachment as ENSchemeAttachmentControllerSoapPort;
  try
    ENSchemeAttachmentObj :=
      TempENSchemeAttachment.getObject(
        StrToInt(sgENSchemeAttachment.Cells[0, sgENSchemeAttachment.Row]));
  except
    on EConvertError do Exit;
  end;
  vSchemeFile := ENSchemeAttachmentObj.schemeFile;
  MS := TMemoryStream.Create; //Создание буфера для содержащегося в БД архива или файла
  try
    MS.Position := 0;
    for i := 0 to Length(vSchemeFile) - 1 do //Побайтная запись в буфер
      MS.Write(vSchemeFile[i], 1); //содержащегося в БД архива или файла

    OutPath := ExtractFilePath(Application.ExeName) + 'Schemes\'; //Указание пути,
    if not DirectoryExists(OutPath) then //проверка существавания директории
      CreateDir(OutPath); //и создание при необходимости папки для выходного файла
    InPath := OutPath + 'Temp\'; //Указание пути всех временных архивов

    if ENSchemeAttachmentObj.schemeName <> '' then
      begin //Задание полного пути выходного файла
        OutPath := OutPath + ENSchemeAttachmentObj.schemeName;
        if ENSchemeAttachmentObj.schemeExt <> '' then
          OutPath := OutPath + '.' +
            ENSchemeAttachmentObj.schemeExt;
        IsFileNamed := True; //Указание, что файл именован
      end
    else
      begin
        OutPath := OutPath + 'Схема.dsc';
        IsFileNamed := False; //Указание, что файл не именован
      end;
    if IsFileNamed then //Если строка БД содержит имя файла
      begin
        if ENSchemeAttachmentObj.isPacked = 0 then //Если файл не упакован
          MS.SaveToFile(OutPath) //Сохранение буфера в выходной файл
        else {ENSchemeAttachmentObj.isPacked = 1 then} //Иначе, если файл упакован
          begin
            if not DirectoryExists(InPath) then //Проверка существования директории
              CreateDir(InPath); //и создание при необходимости папки временных архивов
            InPath := InPath + ENSchemeAttachmentObj.schemeName + '.zip'; //Задание полного пути выходного архива
            MS.SaveToFile(InPath); //Сохранение буфера в выходной архив
            if UnpackFile(InPath, OutPath) then //Если удалось распаковать файл,
              DeleteFile(InPath) //то удаление временного архива
            else //Если не удалось распаковать файл
              begin
                Application.MessageBox(
                  PChar('Не удалось распаковать временный архив!' + #13#10 +
                  'Возможно, вложение повреждено.'), PChar(MB_ICONWARNING));
                Exit; //Выход
              end;
          end;
      end;
  finally
    FreeAndNil(MS);
  end;
  if FileExists(OutPath) then
    begin
      if Application.MessageBox(
        PChar('Данные успешно извлечены в файл' +  #13#10 + '"' +
          OutPath + '". Открыть?'),
        PChar('Представление объекта энергетики:'),
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES
      then
        ShellExecute(0, PChar('open'), PChar('"' + OutPath + '"'), nil, nil,
          SW_SHOWMAXIMIZED);
    end
  else
    Application.MessageBox(PChar(
      'Не удалось восстановление из базы данных EnergyNet'
      + #13#10 + 'в файл "' + OutPath + '"!'),
      PChar('Внимание!'), MB_ICONWARNING);
end;

procedure TfrmENSchemeAttachmentShow.actNewSchemeExecute(Sender: TObject);
begin
  //WinExec(PAnsiChar(SCEF), SW_SHOWMAXIMIZED); //PRIC-580. Команда WinExec
  //срабатывает после компиляции в Borland Delphi 7 и не срабатывает после
  //компиляции в Embarcadero Delphi XE. Поэтому, согласно SUPP-8966:
  ShellExecute(0, PChar('open'), PChar(SCEF), nil, nil, SW_SHOWMAXIMIZED);
end;

end.