
unit ShowENIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENIPController, AdvObj, ExtCtrls, StdCtrls ;


type
  TfrmENIPShow = class(TChildForm)  
  HTTPRIOENIP: THTTPRIO;
    ImageList1: TImageList;
    sgENIP: TAdvStringGrid;
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
    miSplit1: TMenuItem;
    miCopyNewVersionIP: TMenuItem;
    actCopyNewVersionIP: TAction;
    actCreate: TAction;
    actUndoCreate: TAction;
    actApprove: TAction;
    actUndoApprove: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Panel1: TPanel;
    Label6: TLabel;
    Shape3: TShape;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENIPTopLeftChanged(Sender: TObject);
procedure sgENIPDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actCopyNewVersionIPExecute(Sender: TObject);
    procedure actCreateExecute(Sender: TObject);
    procedure actUndoCreateExecute(Sender: TObject);
    procedure actApproveExecute(Sender: TObject);
    procedure actUndoApproveExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENIPShow : TfrmENIPShow;
 // ENIPObj: ENIP;
 // ENIPFilterObj: ENIPFilter;
  
  
implementation

uses Main, EditENIP, EditENIPFilter, ENConsts;


{$R *.dfm}

var
  //frmENIPShow : TfrmENIPShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENIPHeaders: array [1..10] of String =
        ( 'Код'
          ,'Найменування ІП'
          ,'Рік ІП'
          ,'Версія ІП'
          ,'Статус ІП'
          ,'Примітка'
          ,'Дата створення'
          ,'Дата зміни'
          ,'Користувач, який створив запис'
          ,'Користувач, який вніс зміни'
         // ,'Дата та час останніх змін запису'
        );
   

procedure TfrmENIPShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENIPShow:=nil;
    inherited;
  end;


procedure TfrmENIPShow.FormShow(Sender: TObject);
var
  TempENIP: ENIPControllerSoapPort;
  i: Integer;
  ENIPList: ENIPShortList;
  begin

  // DisableActions([actCopyNewVersionIP]);
  sgENIP.Clear;
  SetGridHeaders(ENIPHeaders, sgENIP.ColumnHeaders);
  ColCount:=100;
  TempENIP :=  HTTPRIOENIP as ENIPControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENIPFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIPList := TempENIP.getScrollableFilteredList(ENIPFilter(FilterObject),0,ColCount);


  LastCount:=High(ENIPList.list);


  if LastCount > -1 then
     sgENIP.RowCount:=LastCount+2
  else
     sgENIP.RowCount:=2;

   with sgENIP do
    for i:=0 to LastCount do
      begin

        Application.ProcessMessages;


        if ENIPList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENIPList.list[i].code)
        else
        Cells[0,i+1] := '';

        if ENIPList.list[i].lastIpCode = ENIPList.list[i].code then
        RowColor[i+1]:= $0080FF80;


        Cells[1,i+1] := ENIPList.list[i].name;
        if ENIPList.list[i].yearGen = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENIPList.list[i].yearGen);
        if ENIPList.list[i].version = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENIPList.list[i].version);

         Cells[4,i+1] := ENIPList.list[i].statusRefName;

        Cells[5,i+1] := ENIPList.list[i].commentGen;
        if ENIPList.list[i].dateAdd = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENIPList.list[i].dateAdd);
        if ENIPList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(ENIPList.list[i].dateEdit);
        Cells[8,i+1] := ENIPList.list[i].userAdd;
        Cells[9,i+1] := ENIPList.list[i].userEdit;
        
        LastRow:=i+1;
        sgENIP.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENIP.Row:=1;
end;

procedure TfrmENIPShow.PopupMenu1Popup(Sender: TObject);
var TempENIP: ENIPControllerSoapPort;
    ObjCode: Integer;
    Obj: ENIP;
begin
  try
    ObjCode := StrToInt(sgENIP.Cells[0, sgENIP.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;
  Obj := TempENIP.getObject(ObjCode);

  actCreate.Enabled := (Obj.statusRef.code = ENIPSTATUS_DRAFT);
  actUndoCreate.Enabled := (Obj.statusRef.code = ENIPSTATUS_CREATED);
  actApprove.Enabled := (Obj.statusRef.code = ENIPSTATUS_CREATED);
  actUndoApprove.Enabled := (Obj.statusRef.code = ENIPSTATUS_APPROVED);

  actCopyNewVersionIP.Enabled := (Obj.statusRef.code = ENIPSTATUS_APPROVED);
end;

procedure TfrmENIPShow.sgENIPTopLeftChanged(Sender: TObject);
var
  TempENIP: ENIPControllerSoapPort;
  i,CurrentRow: Integer;
  ENIPList: ENIPShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENIP.TopRow + sgENIP.VisibleRowCount) = ColCount
  then
    begin
      TempENIP :=  HTTPRIOENIP as ENIPControllerSoapPort;
      CurrentRow:=sgENIP.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENIPFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENIPList := TempENIP.getScrollableFilteredList(ENIPFilter(FilterObject),ColCount-1, 100);



  sgENIP.RowCount:=sgENIP.RowCount+100;
  LastCount:=High(ENIPList.list);
  with sgENIP do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENIPList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENIPList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENIPList.list[i].name;
        if ENIPList.list[i].yearGen = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENIPList.list[i].yearGen);
        if ENIPList.list[i].version = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENIPList.list[i].version);

          Cells[4,i+1] := ENIPList.list[i].statusRefName;

        Cells[5,i+CurrentRow] := ENIPList.list[i].commentGen;
        if ENIPList.list[i].dateAdd = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENIPList.list[i].dateAdd);
        if ENIPList.list[i].dateEdit = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDateTimeWithDate2String(ENIPList.list[i].dateEdit);
        Cells[8,i+CurrentRow] := ENIPList.list[i].userAdd;
        Cells[9,i+CurrentRow] := ENIPList.list[i].userEdit;
        
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENIP.Row:=CurrentRow-5;
   sgENIP.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENIPShow.sgENIPDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENIP,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENIPShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENIP.RowCount-1 do
   for j:=0 to sgENIP.ColCount-1 do
     sgENIP.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENIPShow.actViewExecute(Sender: TObject);
Var TempENIP: ENIPControllerSoapPort;
begin
 TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;
   try
     ENIPObj := TempENIP.getObject(StrToInt(sgENIP.Cells[0,sgENIP.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENIPEdit:=TfrmENIPEdit.Create(Application, dsView);
  try
    frmENIPEdit.ShowModal;
  finally
    frmENIPEdit.Free;
    frmENIPEdit:=nil;
  end;
end;

procedure TfrmENIPShow.actEditExecute(Sender: TObject);
Var TempENIP: ENIPControllerSoapPort;
begin
  TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;
  try
    ENIPObj := TempENIP.getObject(StrToInt(sgENIP.Cells[0, sgENIP.Row]));
  except
    on EConvertError do Exit;
  end;

  if ENIPObj.statusRef.code <> ENIPSTATUS_DRAFT then
  begin
    Application.MessageBox(PChar('Редагувати можна тільки Інвестпрограму зі статусом "Чорнова" !'), PChar('Увага !'), MB_ICONWARNING);
    Exit;
  end;

  frmENIPEdit := TfrmENIPEdit.Create(Application, dsEdit);
  try
    if frmENIPEdit.ShowModal = mrOk then
    begin
      //TempENIP.save(ENIPObj);
      UpdateGrid(Sender);
    end;
  finally
    frmENIPEdit.Free;
    frmENIPEdit := nil;
  end;
end;

procedure TfrmENIPShow.actCreateExecute(Sender: TObject);
Var TempENIP: ENIPControllerSoapPort;
    ObjCode: Integer;
begin
  TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;
  try
    ObjCode := StrToInt(sgENIP.Cells[0, sgENIP.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести Інвестпрограму в статус "СКЛАДЕНА" ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENIP.create(ObjCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENIPShow.actDeleteExecute(Sender: TObject);
Var TempENIP: ENIPControllerSoapPort;
    ObjCode: Integer;
    Obj: ENIP;
begin
  TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;
  try
    ObjCode := StrToInt(sgENIP.Cells[0, sgENIP.Row]);
  except
    on EConvertError do Exit;
  end;

  Obj := TempENIP.getObject(ObjCode);

  if Obj.statusRef.code <> ENIPSTATUS_DRAFT then
  begin
    Application.MessageBox(PChar('Видаляти можна тільки Інвестпрограму зі статусом "Чорнова" !'), PChar('Увага !'), MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити Інвестпрограму ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENIP.remove(ObjCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENIPShow.actInsertExecute(Sender: TObject);
// Var TempENIP: ENIPControllerSoapPort; 
begin
  // TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENIPObj:=ENIP.Create;

   //ENIPObj.dateAdd:= TXSDateTime.Create;
   
   //ENIPObj.dateEdit:= TXSDateTime.Create;
   
   //ENIPObj.modifytime:= TXSDateTime.Create;
   


  try
    frmENIPEdit:=TfrmENIPEdit.Create(Application, dsInsert);
    try
      if frmENIPEdit.ShowModal = mrOk then
      begin
        if ENIPObj<>nil then
            //TempENIP.add(ENIPObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENIPEdit.Free;
      frmENIPEdit:=nil;
    end;
  finally
    ENIPObj.Free;
  end;
end;

procedure TfrmENIPShow.actUndoApproveExecute(Sender: TObject);
Var TempENIP: ENIPControllerSoapPort;
    ObjCode: Integer;
begin
  TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;
  try
    ObjCode := StrToInt(sgENIP.Cells[0, sgENIP.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити затвердження Інвестпрограми (повернути в статус "СКЛАДЕНА") ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENIP.undoApprove(ObjCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENIPShow.actUndoCreateExecute(Sender: TObject);
Var TempENIP: ENIPControllerSoapPort;
    ObjCode: Integer;
begin
  TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;
  try
    ObjCode := StrToInt(sgENIP.Cells[0, sgENIP.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити складання Інвестпрограми (повернути в статус "ЧОРНОВА") ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENIP.undoCreate(ObjCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENIPShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENIPShow.actFilterExecute(Sender: TObject);
begin
{frmENIPFilterEdit:=TfrmENIPFilterEdit.Create(Application, dsInsert);
  try
    ENIPFilterObj := ENIPFilter.Create;
    SetNullIntProps(ENIPFilterObj);
    SetNullXSProps(ENIPFilterObj);

    if frmENIPFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENIPFilter.Create;
      FilterObject := ENIPFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENIPFilterEdit.Free;
    frmENIPFilterEdit:=nil;
  end;}
end;

procedure TfrmENIPShow.actApproveExecute(Sender: TObject);
Var TempENIP: ENIPControllerSoapPort;
    ObjCode: Integer;
begin
  TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;
  try
    ObjCode := StrToInt(sgENIP.Cells[0, sgENIP.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести Інвестпрограму в статус "ЗАТВЕРДЖЕНА" ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENIP.approve(ObjCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENIPShow.actCopyNewVersionIPExecute(Sender: TObject);
Var TempENIP: ENIPControllerSoapPort;
    ObjCode: Integer;
begin
  TempENIP := HTTPRIOENIP as ENIPControllerSoapPort;
  try
    ObjCode := StrToInt(sgENIP.Cells[0, sgENIP.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте скласти нову версію ІП ???'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENIP.сopyNewVersionIP(ObjCode);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENIPShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.