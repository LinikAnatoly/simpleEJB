
unit ShowENServicesFromSideObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENServicesFromSideObjectController, AdvObj ;


type
  TfrmENServicesFromSideObjectShow = class(TChildForm)  
  HTTPRIOENServicesFromSideObject: THTTPRIO;
    ImageList1: TImageList;
    sgENServicesFromSideObject: TAdvStringGrid;
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
    actSigned: TAction;
    actUnSigned: TAction;
    N5: TMenuItem;
    miSigned: TMenuItem;
    miUnSigned: TMenuItem;
    actPay: TAction;
    actUnPay: TAction;
    miPay: TMenuItem;
    miUnPay: TMenuItem;
    actWorkExecuted: TAction;
    actWorkUnExecuted: TAction;
    actWorkCompleted: TAction;
    actWorkUnCompleted: TAction;
    miWorkExecuted: TMenuItem;
    miWorkUnExecuted: TMenuItem;
    miWorkCompleted: TMenuItem;
    miWorkUnCompleted: TMenuItem;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENServicesFromSideObjectTopLeftChanged(Sender: TObject);
procedure sgENServicesFromSideObjectDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actSignedExecute(Sender: TObject);
    procedure actUnSignedExecute(Sender: TObject);
    procedure actPayExecute(Sender: TObject);
    procedure actUnPayExecute(Sender: TObject);
    procedure actWorkExecutedExecute(Sender: TObject);
    procedure actWorkUnExecutedExecute(Sender: TObject);
    procedure actWorkCompletedExecute(Sender: TObject);
    procedure actWorkUnCompletedExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENServicesFromSideObjectShow : TfrmENServicesFromSideObjectShow;
 // ENServicesFromSideObjectObj: ENServicesFromSideObject;
 // ENServicesFromSideObjectFilterObj: ENServicesFromSideObjectFilter;
  
  
implementation

uses Main, EditENServicesFromSideObject, EditENServicesFromSideObjectFilter,
  EditENServicesFromSideObjectConsolid, ENConsts;


{$R *.dfm}

var
  //frmENServicesFromSideObjectShow : TfrmENServicesFromSideObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENServicesFromSideObjectHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер договору'
          ,'Дата договору'
          ,'Найменування організації(постачальник послуг)'
          ,'код організації'
          ,'код договору у фін.кол.'
          ,'PK договору у фін.кол.'
          ,'Примітка'
          ,'Статус'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
   

procedure TfrmENServicesFromSideObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENServicesFromSideObjectShow:=nil;
    inherited;
  end;


procedure TfrmENServicesFromSideObjectShow.FormShow(Sender: TObject);
var
  TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
  i: Integer;
  ENServicesFromSideObjectList: ENServicesFromSideObjectShortList;
  begin
  SetGridHeaders(ENServicesFromSideObjectHeaders, sgENServicesFromSideObject.ColumnHeaders);
  ColCount:=100;
  TempENServicesFromSideObject :=  HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesFromSideObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServicesFromSideObjectFilter(FilterObject).orderBySQL := ' enservicesfromsidebjct.code desc ' ;

  ENServicesFromSideObjectList := TempENServicesFromSideObject.getScrollableFilteredList(ENServicesFromSideObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENServicesFromSideObjectList.list);

  if LastCount > -1 then
     sgENServicesFromSideObject.RowCount:=LastCount+2
  else
     sgENServicesFromSideObject.RowCount:=2;

   with sgENServicesFromSideObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesFromSideObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServicesFromSideObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENServicesFromSideObjectList.list[i].contractNumber;
        if ENServicesFromSideObjectList.list[i].contractDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENServicesFromSideObjectList.list[i].contractDate);
        Cells[3,i+1] := ENServicesFromSideObjectList.list[i].name;
        Cells[4,i+1] := ENServicesFromSideObjectList.list[i].partnerCode;
        Cells[5,i+1] := ENServicesFromSideObjectList.list[i].finDocCode;
        if ENServicesFromSideObjectList.list[i].finDocID = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(ENServicesFromSideObjectList.list[i].finDocID);
        Cells[7,i+1] := ENServicesFromSideObjectList.list[i].commentGen;
        Cells[8,i+1] := ENServicesFromSideObjectList.list[i].statusRefName;
        Cells[9,i+1] := ENServicesFromSideObjectList.list[i].userGen;
        if ENServicesFromSideObjectList.list[i].dateEdit = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDate2String(ENServicesFromSideObjectList.list[i].dateEdit);
        LastRow:=i+1;
        sgENServicesFromSideObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENServicesFromSideObject.Row:=1;
end;

procedure TfrmENServicesFromSideObjectShow.PopupMenu1Popup(Sender: TObject);
var
 objCode : Integer;
 TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
 servsideObj : ENServicesFromSideObject;
begin
  TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;

  try
    objCode := StrToInt(sgENServicesFromSideObject.Cells[0,sgENServicesFromSideObject.Row]);
  except
    on EConvertError do Exit;
  end;

    DisableActions([actSigned,actUnSigned, actPay , actUnPay , actWorkExecuted , actWorkUnExecuted , actWorkCompleted , actWorkUnCompleted]);
    servsideObj := TempENServicesFromSideObject.getObject(objCode);
    actSigned.Enabled := servsideObj.statusRef.code  = ENSERVICESFROMSIDEOBJECTSTATUS_DRAFT;
    actUnSigned.Enabled := servsideObj.statusRef.code  = ENSERVICESFROMSIDEOBJECTSTATUS_SIGNED;
    actPay.Enabled := servsideObj.statusRef.code  = ENSERVICESFROMSIDEOBJECTSTATUS_SIGNED;
    actUnPay.Enabled := servsideObj.statusRef.code  = ENSERVICESFROMSIDEOBJECTSTATUS_PAY;
    actWorkExecuted.Enabled := servsideObj.statusRef.code  = ENSERVICESFROMSIDEOBJECTSTATUS_PAY;
    actWorkUnExecuted.Enabled := servsideObj.statusRef.code  = ENSERVICESFROMSIDEOBJECTSTATUS_WORK_EXECUTE;
    actWorkCompleted.Enabled := servsideObj.statusRef.code  = ENSERVICESFROMSIDEOBJECTSTATUS_WORK_EXECUTE;
    actWorkUnCompleted.Enabled := servsideObj.statusRef.code  = ENSERVICESFROMSIDEOBJECTSTATUS_WORK_COMPLETED;

end;

procedure TfrmENServicesFromSideObjectShow.sgENServicesFromSideObjectTopLeftChanged(Sender: TObject);
var
  TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENServicesFromSideObjectList: ENServicesFromSideObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENServicesFromSideObject.TopRow + sgENServicesFromSideObject.VisibleRowCount) = ColCount
  then
    begin
      TempENServicesFromSideObject :=  HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;
      CurrentRow:=sgENServicesFromSideObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesFromSideObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServicesFromSideObjectList := TempENServicesFromSideObject.getScrollableFilteredList(ENServicesFromSideObjectFilter(FilterObject),ColCount-1, 100);



  sgENServicesFromSideObject.RowCount:=sgENServicesFromSideObject.RowCount+100;
  LastCount:=High(ENServicesFromSideObjectList.list);
  with sgENServicesFromSideObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesFromSideObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENServicesFromSideObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENServicesFromSideObjectList.list[i].contractNumber;
        if ENServicesFromSideObjectList.list[i].contractDate = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENServicesFromSideObjectList.list[i].contractDate);
        Cells[3,i+CurrentRow] := ENServicesFromSideObjectList.list[i].name;
        Cells[4,i+CurrentRow] := ENServicesFromSideObjectList.list[i].partnerCode;
        Cells[5,i+CurrentRow] := ENServicesFromSideObjectList.list[i].finDocCode;
        if ENServicesFromSideObjectList.list[i].finDocID = Low(Integer) then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := IntToStr(ENServicesFromSideObjectList.list[i].finDocID);
        Cells[7,i+CurrentRow] := ENServicesFromSideObjectList.list[i].commentGen;
        Cells[8,i+CurrentRow] := ENServicesFromSideObjectList.list[i].statusRefName;
        Cells[9,i+CurrentRow] := ENServicesFromSideObjectList.list[i].userGen;
        if ENServicesFromSideObjectList.list[i].dateEdit = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := XSDate2String(ENServicesFromSideObjectList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENServicesFromSideObject.Row:=CurrentRow-5;
   sgENServicesFromSideObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENServicesFromSideObjectShow.sgENServicesFromSideObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENServicesFromSideObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENServicesFromSideObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENServicesFromSideObject.RowCount-1 do
   for j:=0 to sgENServicesFromSideObject.ColCount-1 do
     sgENServicesFromSideObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENServicesFromSideObjectShow.actViewExecute(Sender: TObject);
Var TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
 TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;
   try
     ENServicesFromSideObjectObj := TempENServicesFromSideObject.getObject(StrToInt(sgENServicesFromSideObject.Cells[0,sgENServicesFromSideObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENServicesFromSideObjectConsolidEdit:=TfrmENServicesFromSideObjectConsolidEdit.Create(Application, dsView);
  try
    frmENServicesFromSideObjectConsolidEdit.ShowModal;
  finally
    frmENServicesFromSideObjectConsolidEdit.Free;
    frmENServicesFromSideObjectConsolidEdit:=nil;
  end;
end;

procedure TfrmENServicesFromSideObjectShow.actWorkCompletedExecute(
  Sender: TObject);
var
 objCode : Integer;
 TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;

  try
    objCode := StrToInt(sgENServicesFromSideObject.Cells[0,sgENServicesFromSideObject.Row]);
  except
    on EConvertError do Exit;
  end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести в статус "Завершений"?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesFromSideObject.workCompleted(objCode);

    Application.MessageBox(PChar('Договір переведений в статус "Завершений"...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;

end;

procedure TfrmENServicesFromSideObjectShow.actWorkExecutedExecute(
  Sender: TObject);
var
 objCode : Integer;
 TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;

  try
    objCode := StrToInt(sgENServicesFromSideObject.Cells[0,sgENServicesFromSideObject.Row]);
  except
    on EConvertError do Exit;
  end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести договір в статус "Роботи виконані" ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesFromSideObject.workExecuted(objCode);

    Application.MessageBox(PChar('Договір переведений в статус "Роботи виконані"...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;

end;

procedure TfrmENServicesFromSideObjectShow.actWorkUnCompletedExecute(
  Sender: TObject);
var
 objCode : Integer;
 TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;

  try
    objCode := StrToInt(sgENServicesFromSideObject.Cells[0,sgENServicesFromSideObject.Row]);
  except
    on EConvertError do Exit;
  end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити статус "Завершений"?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesFromSideObject.workUnCompleted(objCode);

    Application.MessageBox(PChar('Статус "Завершений" відмінено '), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;

end;

procedure TfrmENServicesFromSideObjectShow.actWorkUnExecutedExecute(
  Sender: TObject);
var
 objCode : Integer;
 TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;

  try
    objCode := StrToInt(sgENServicesFromSideObject.Cells[0,sgENServicesFromSideObject.Row]);
  except
    on EConvertError do Exit;
  end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити статус "Роботи виконані" ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesFromSideObject.workUnExecuted(objCode);

    Application.MessageBox(PChar('Договір переведений в статус "Сплачений"...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;

end;

procedure TfrmENServicesFromSideObjectShow.actEditExecute(Sender: TObject);
Var TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
 TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;
   try
     ENServicesFromSideObjectObj := TempENServicesFromSideObject.getObject(StrToInt(sgENServicesFromSideObject.Cells[0,sgENServicesFromSideObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENServicesFromSideObjectConsolidEdit:=TfrmENServicesFromSideObjectConsolidEdit.Create(Application, dsEdit);
  try
    if frmENServicesFromSideObjectConsolidEdit.ShowModal= mrOk then
      begin
        //TempENServicesFromSideObject.save(ENServicesFromSideObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENServicesFromSideObjectConsolidEdit.Free;
    frmENServicesFromSideObjectConsolidEdit:=nil;
  end;
end;

procedure TfrmENServicesFromSideObjectShow.actDeleteExecute(Sender: TObject);
Var TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENServicesFromSideObject.Cells[0,sgENServicesFromSideObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Об"єкти (договори) - послуги зі сторону) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENServicesFromSideObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENServicesFromSideObjectShow.actInsertExecute(Sender: TObject);
Var TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;
  ENServicesFromSideObjectObj:=ENServicesFromSideObject.Create;

   //ENServicesFromSideObjectObj.contractDate:= TXSDate.Create;
   //ENServicesFromSideObjectObj.dateEdit:= TXSDate.Create;


  try
    frmENServicesFromSideObjectConsolidEdit:=TfrmENServicesFromSideObjectConsolidEdit.Create(Application, dsInsert);
    try
      if frmENServicesFromSideObjectConsolidEdit.ShowModal = mrOk then
      begin
        if ENServicesFromSideObjectObj<>nil then
            //TempENServicesFromSideObject.add(ENServicesFromSideObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENServicesFromSideObjectConsolidEdit.Free;
      frmENServicesFromSideObjectConsolidEdit:=nil;
    end;
  finally
    ENServicesFromSideObjectObj.Free;
  end;
end;

procedure TfrmENServicesFromSideObjectShow.actUnPayExecute(Sender: TObject);
var
 objCode : Integer;
 TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;

  try
    objCode := StrToInt(sgENServicesFromSideObject.Cells[0,sgENServicesFromSideObject.Row]);
  except
    on EConvertError do Exit;
  end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити сплату договору?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesFromSideObject.unPay(objCode);

    Application.MessageBox(PChar('Договір переведений в статус Підписаний...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;

end;

procedure TfrmENServicesFromSideObjectShow.actUnSignedExecute(Sender: TObject);
var objCode : Integer;
    TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;

  try
    objCode := StrToInt(sgENServicesFromSideObject.Cells[0,sgENServicesFromSideObject.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити підписання договору?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesFromSideObject.unSigned(objCode);

    Application.MessageBox(PChar('Підписання відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENServicesFromSideObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENServicesFromSideObjectShow.actFilterExecute(Sender: TObject);
begin
frmENServicesFromSideObjectFilterEdit:=TfrmENServicesFromSideObjectFilterEdit.Create(Application, dsInsert);
  try
    ENServicesFromSideObjectFilterObj := ENServicesFromSideObjectFilter.Create;
    SetNullIntProps(ENServicesFromSideObjectFilterObj);
    SetNullXSProps(ENServicesFromSideObjectFilterObj);

    if frmENServicesFromSideObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENServicesFromSideObjectFilter.Create;
      FilterObject := ENServicesFromSideObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENServicesFromSideObjectFilterEdit.Free;
    frmENServicesFromSideObjectFilterEdit:=nil;
  end;
end;

procedure TfrmENServicesFromSideObjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENServicesFromSideObjectShow.actPayExecute(Sender: TObject);
var
 objCode : Integer;
 TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;

  try
    objCode := StrToInt(sgENServicesFromSideObject.Cells[0,sgENServicesFromSideObject.Row]);
  except
    on EConvertError do Exit;
  end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте сплатити договір?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesFromSideObject.pay(objCode);

    Application.MessageBox(PChar('Договір сплачено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;

end;


procedure TfrmENServicesFromSideObjectShow.actSignedExecute(Sender: TObject);
var
 objCode : Integer;
 TempENServicesFromSideObject: ENServicesFromSideObjectControllerSoapPort;
begin
  TempENServicesFromSideObject := HTTPRIOENServicesFromSideObject as ENServicesFromSideObjectControllerSoapPort;

  try
    objCode := StrToInt(sgENServicesFromSideObject.Cells[0,sgENServicesFromSideObject.Row]);
  except
    on EConvertError do Exit;
  end;


  if Application.MessageBox(PChar('Ви дійсно бажаєте підписати договір?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENServicesFromSideObject.signed(objCode);

    Application.MessageBox(PChar('Договір підписано...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;

end;

end.