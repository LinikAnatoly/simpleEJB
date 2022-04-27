
unit ShowENTransformerObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransformerObjectController ;


type
  TfrmENTransformerObjectShow = class(TChildForm)  
  HTTPRIOENTransformerObject: THTTPRIO;
    ImageList1: TImageList;
    sgENTransformerObject: TAdvStringGrid;
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

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENTransformerObjectTopLeftChanged(Sender: TObject);
procedure sgENTransformerObjectDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENTransformerObjectObj: ENTransformerObject;
 // ENTransformerObjectFilterObj: ENTransformerObjectFilter;
  
  
implementation

uses Main, EditENTransformerObject, EditENTransformerObjectFilter;


{$R *.dfm}

var
  //frmENTransformerObjectShow : TfrmENTransformerObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransformerObjectHeaders: array [1..9] of String =
        ( 'Код'
          ,'Назва'
          ,'Заводский номер'
          ,'Рік виготовлення'
          ,'Напруга високої сторони (кВ)'
          ,'Напруга низької сторони (кВ)'
          ,'Потужність (кВА)'
          ,'Бухгалтерське найменування'
          ,'Номенклатурний номер'
        );
   

procedure TfrmENTransformerObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransformerObjectShow:=nil;
    inherited;
  end;


procedure TfrmENTransformerObjectShow.FormShow(Sender: TObject);
var
  TempENTransformerObject: ENTransformerObjectControllerSoapPort;
  i: Integer;
  ENTransformerObjectList: ENTransformerObjectShortList;
  begin
  SetGridHeaders(ENTransformerObjectHeaders, sgENTransformerObject.ColumnHeaders);
  ColCount:=100;
  TempENTransformerObject :=  HTTPRIOENTransformerObject as ENTransformerObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransformerObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransformerObjectList := TempENTransformerObject.getScrollableFilteredList(ENTransformerObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransformerObjectList.list);

  if LastCount > -1 then
     sgENTransformerObject.RowCount:=LastCount+2
  else
     sgENTransformerObject.RowCount:=2;

   with sgENTransformerObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransformerObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransformerObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTransformerObjectList.list[i].name;
        Cells[2,i+1] := ENTransformerObjectList.list[i].buildNumber;
        if ENTransformerObjectList.list[i].buildYear = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENTransformerObjectList.list[i].buildYear);
        if ENTransformerObjectList.list[i].voltageHi = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransformerObjectList.list[i].voltageHi.DecimalString;
        if ENTransformerObjectList.list[i].voltageLow = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTransformerObjectList.list[i].voltageLow.DecimalString;
        if ENTransformerObjectList.list[i].nomPower = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENTransformerObjectList.list[i].nomPower.DecimalString;
        Cells[7,i+1] := ENTransformerObjectList.list[i].buhName;
        Cells[8,i+1] := ENTransformerObjectList.list[i].invNumber;
        LastRow:=i+1;
        sgENTransformerObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransformerObject.Row:=1;
end;

procedure TfrmENTransformerObjectShow.sgENTransformerObjectTopLeftChanged(Sender: TObject);
var
  TempENTransformerObject: ENTransformerObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransformerObjectList: ENTransformerObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransformerObject.TopRow + sgENTransformerObject.VisibleRowCount) = ColCount
  then
    begin
      TempENTransformerObject :=  HTTPRIOENTransformerObject as ENTransformerObjectControllerSoapPort;
      CurrentRow:=sgENTransformerObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransformerObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransformerObjectList := TempENTransformerObject.getScrollableFilteredList(ENTransformerObjectFilter(FilterObject),ColCount-1, 100);



  sgENTransformerObject.RowCount:=sgENTransformerObject.RowCount+100;
  LastCount:=High(ENTransformerObjectList.list);
  with sgENTransformerObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransformerObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransformerObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTransformerObjectList.list[i].name;
        Cells[2,i+CurrentRow] := ENTransformerObjectList.list[i].buildNumber;
        if ENTransformerObjectList.list[i].buildYear = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENTransformerObjectList.list[i].buildYear);
        if ENTransformerObjectList.list[i].voltageHi = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENTransformerObjectList.list[i].voltageHi.DecimalString;
        if ENTransformerObjectList.list[i].voltageLow = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENTransformerObjectList.list[i].voltageLow.DecimalString;
        if ENTransformerObjectList.list[i].nomPower = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENTransformerObjectList.list[i].nomPower.DecimalString;
        Cells[7,i+CurrentRow] := ENTransformerObjectList.list[i].buhName;
        Cells[8,i+CurrentRow] := ENTransformerObjectList.list[i].invNumber;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransformerObject.Row:=CurrentRow-5;
   sgENTransformerObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransformerObjectShow.sgENTransformerObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransformerObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransformerObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransformerObject.RowCount-1 do
   for j:=0 to sgENTransformerObject.ColCount-1 do
     sgENTransformerObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransformerObjectShow.actViewExecute(Sender: TObject);
Var TempENTransformerObject: ENTransformerObjectControllerSoapPort;
begin
 TempENTransformerObject := HTTPRIOENTransformerObject as ENTransformerObjectControllerSoapPort;
   try
     ENTransformerObjectObj := TempENTransformerObject.getObject(StrToInt(sgENTransformerObject.Cells[0,sgENTransformerObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransformerObjectEdit:=TfrmENTransformerObjectEdit.Create(Application, dsView);
  try
    frmENTransformerObjectEdit.ShowModal;
  finally
    frmENTransformerObjectEdit.Free;
    frmENTransformerObjectEdit:=nil;
  end;
end;

procedure TfrmENTransformerObjectShow.actEditExecute(Sender: TObject);
Var TempENTransformerObject: ENTransformerObjectControllerSoapPort;
begin
 TempENTransformerObject := HTTPRIOENTransformerObject as ENTransformerObjectControllerSoapPort;
   try
     ENTransformerObjectObj := TempENTransformerObject.getObject(StrToInt(sgENTransformerObject.Cells[0,sgENTransformerObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransformerObjectEdit:=TfrmENTransformerObjectEdit.Create(Application, dsEdit);
  try
    if frmENTransformerObjectEdit.ShowModal= mrOk then
      begin
        //TempENTransformerObject.save(ENTransformerObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransformerObjectEdit.Free;
    frmENTransformerObjectEdit:=nil;
  end;
end;

procedure TfrmENTransformerObjectShow.actDeleteExecute(Sender: TObject);
Var TempENTransformerObject: ENTransformerObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransformerObject := HTTPRIOENTransformerObject as ENTransformerObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransformerObject.Cells[0,sgENTransformerObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Трансформатори на Ремонті) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransformerObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransformerObjectShow.actInsertExecute(Sender: TObject);
Var TempENTransformerObject: ENTransformerObjectControllerSoapPort;
begin
  TempENTransformerObject := HTTPRIOENTransformerObject as ENTransformerObjectControllerSoapPort;
  ENTransformerObjectObj:=ENTransformerObject.Create;

   ENTransformerObjectObj.voltageHi:= TXSDecimal.Create;
   ENTransformerObjectObj.voltageLow:= TXSDecimal.Create;
   ENTransformerObjectObj.nomPower:= TXSDecimal.Create;


  try
    frmENTransformerObjectEdit:=TfrmENTransformerObjectEdit.Create(Application, dsInsert);
    try
      if frmENTransformerObjectEdit.ShowModal = mrOk then
      begin
        if ENTransformerObjectObj<>nil then
            //TempENTransformerObject.add(ENTransformerObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransformerObjectEdit.Free;
      frmENTransformerObjectEdit:=nil;
    end;
  finally
    ENTransformerObjectObj.Free;
  end;
end;

procedure TfrmENTransformerObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransformerObjectShow.actFilterExecute(Sender: TObject);
begin
  frmENTransformerObjectFilterEdit:=TfrmENTransformerObjectFilterEdit.Create(Application, dsInsert);
  try
    ENTransformerObjectFilterObj := ENTransformerObjectFilter.Create;
    SetNullIntProps(ENTransformerObjectFilterObj);
    SetNullXSProps(ENTransformerObjectFilterObj);

    if frmENTransformerObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTransformerObjectFilter.Create;
      FilterObject := ENTransformerObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransformerObjectFilterEdit.Free;
    frmENTransformerObjectFilterEdit:=nil;
  end;
end;

procedure TfrmENTransformerObjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.