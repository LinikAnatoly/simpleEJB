
unit ShowENTransportOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransportOrderController, AdvObj ;


type
  TfrmENTransportOrderShow = class(TChildForm)  
  HTTPRIOENTransportOrder: THTTPRIO;
    ImageList1: TImageList;
    sgENTransportOrder: TAdvStringGrid;
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
procedure sgENTransportOrderTopLeftChanged(Sender: TObject);
procedure sgENTransportOrderDblClick(Sender: TObject);
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
   strFilter : String;
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENTransportOrderShow : TfrmENTransportOrderShow;
 // ENTransportOrderObj: ENTransportOrder;
 // ENTransportOrderFilterObj: ENTransportOrderFilter;
  
  
implementation

uses Main, EditENTransportOrder, EditENTransportOrderFilter;


{$R *.dfm}

var
  //frmENTransportOrderShow : TfrmENTransportOrderShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransportOrderHeaders: array [1..5] of String =
        ( 'Код'
          ,'Номер'
          ,'Період'
          ,'Дата зміни'
          ,'користувач'
        );
   

procedure TfrmENTransportOrderShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransportOrderShow:=nil;
    inherited;
  end;


procedure TfrmENTransportOrderShow.FormShow(Sender: TObject);
var
  TempENTransportOrder: ENTransportOrderControllerSoapPort;
  i: Integer;
  ENTransportOrderList: ENTransportOrderShortList;
  begin
  SetGridHeaders(ENTransportOrderHeaders, sgENTransportOrder.ColumnHeaders);
  ColCount:=100;
  TempENTransportOrder :=  HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportOrderList := TempENTransportOrder.getScrollableFilteredList(ENTransportOrderFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransportOrderList.list);

  if LastCount > -1 then
     sgENTransportOrder.RowCount:=LastCount+2
  else
     sgENTransportOrder.RowCount:=2;




   with sgENTransportOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportOrderList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENTransportOrderList.list[i].numbergen;

        if (ENTransportOrderList.list[i].timeStart = nil) or
           (ENTransportOrderList.list[i].timeFinal = nil) or
           (ENTransportOrderList.list[i].dateStart = nil) or
           (ENTransportOrderList.list[i].dateFinal = nil) then Cells[2,i+1] := ''
        else
           Cells[2,i+1] := 'з ' + XSDateTimeWithDate2String(ENTransportOrderList.list[i].dateStart) + ' ' +
                           XSDateTimeWithDate2String(ENTransportOrderList.list[i].timeStart) + ' ' +
                           'до ' + XSDateTimeWithDate2String(ENTransportOrderList.list[i].dateFinal) + ' ' +
                                XSDateTimeWithDate2String(ENTransportOrderList.list[i].timeFinal);

        if ENTransportOrderList.list[i].dateEdit = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENTransportOrderList.list[i].dateEdit);
        Cells[4,i+1] := ENTransportOrderList.list[i].userGen;
        LastRow:=i+1;
        sgENTransportOrder.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransportOrder.Row:=1;
end;

procedure TfrmENTransportOrderShow.sgENTransportOrderTopLeftChanged(Sender: TObject);
var
  TempENTransportOrder: ENTransportOrderControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransportOrderList: ENTransportOrderShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransportOrder.TopRow + sgENTransportOrder.VisibleRowCount) = ColCount
  then
    begin
      TempENTransportOrder :=  HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
      CurrentRow:=sgENTransportOrder.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportOrderList := TempENTransportOrder.getScrollableFilteredList(ENTransportOrderFilter(FilterObject),ColCount-1, 100);



  sgENTransportOrder.RowCount:=sgENTransportOrder.RowCount+100;
  LastCount:=High(ENTransportOrderList.list);
  with sgENTransportOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
       if ENTransportOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportOrderList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENTransportOrderList.list[i].numbergen;

        if (ENTransportOrderList.list[i].timeStart = nil) or
           (ENTransportOrderList.list[i].timeFinal = nil) or
           (ENTransportOrderList.list[i].dateStart = nil) or
           (ENTransportOrderList.list[i].dateFinal = nil) then Cells[2,i+1] := ''
        else
           Cells[2,i+CurrentRow] := 'з ' + XSDateTimeWithDate2String(ENTransportOrderList.list[i].dateStart) + ' ' +
                           XSDateTimeWithDate2String(ENTransportOrderList.list[i].timeStart) + ' ' +
                           'до ' + XSDateTimeWithDate2String(ENTransportOrderList.list[i].dateFinal) + ' ' +
                                XSDateTimeWithDate2String(ENTransportOrderList.list[i].timeFinal);

        if ENTransportOrderList.list[i].dateEdit = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDateTimeWithDate2String(ENTransportOrderList.list[i].dateEdit);
        Cells[4,i+CurrentRow] := ENTransportOrderList.list[i].userGen;

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransportOrder.Row:=CurrentRow-5;
   sgENTransportOrder.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransportOrderShow.sgENTransportOrderDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransportOrder,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransportOrderShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransportOrder.RowCount-1 do
   for j:=0 to sgENTransportOrder.ColCount-1 do
     sgENTransportOrder.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransportOrderShow.actViewExecute(Sender: TObject);
Var TempENTransportOrder: ENTransportOrderControllerSoapPort;
begin
 TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
   try
     ENTransportOrderObj := TempENTransportOrder.getObject(StrToInt(sgENTransportOrder.Cells[0,sgENTransportOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportOrderEdit:=TfrmENTransportOrderEdit.Create(Application, dsView);
  try
    frmENTransportOrderEdit.ShowModal;
  finally
    frmENTransportOrderEdit.Free;
    frmENTransportOrderEdit:=nil;
  end;
end;

procedure TfrmENTransportOrderShow.actEditExecute(Sender: TObject);
Var TempENTransportOrder: ENTransportOrderControllerSoapPort;
begin
 TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
   try
     ENTransportOrderObj := TempENTransportOrder.getObject(StrToInt(sgENTransportOrder.Cells[0,sgENTransportOrder.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportOrderEdit:=TfrmENTransportOrderEdit.Create(Application, dsEdit);
  try
    if frmENTransportOrderEdit.ShowModal= mrOk then
      begin
        //TempENTransportOrder.save(ENTransportOrderObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransportOrderEdit.Free;
    frmENTransportOrderEdit:=nil;
  end;
end;

procedure TfrmENTransportOrderShow.actDeleteExecute(Sender: TObject);
Var TempENTransportOrder: ENTransportOrderControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportOrder.Cells[0,sgENTransportOrder.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Заявка на транспорт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportOrder.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransportOrderShow.actInsertExecute(Sender: TObject);
Var TempENTransportOrder: ENTransportOrderControllerSoapPort;
begin
  TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;
  ENTransportOrderObj:=ENTransportOrder.Create;

   //ENTransportOrderObj.timeStart:= TXSDateTime.Create;
   
   //ENTransportOrderObj.timeFinal:= TXSDateTime.Create;
   
   //ENTransportOrderObj.dateStart:= TXSDateTime.Create;
   
   //ENTransportOrderObj.dateFinal:= TXSDateTime.Create;
   
   //ENTransportOrderObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENTransportOrderEdit:=TfrmENTransportOrderEdit.Create(Application, dsInsert);
    try
      if frmENTransportOrderEdit.ShowModal = mrOk then
      begin
        if ENTransportOrderObj<>nil then
            //TempENTransportOrder.add(ENTransportOrderObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportOrderEdit.Free;
      frmENTransportOrderEdit:=nil;
    end;
  finally
    ENTransportOrderObj.Free;
  end;
end;

procedure TfrmENTransportOrderShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransportOrderShow.actFilterExecute(Sender: TObject);
begin
{frmENTransportOrderFilterEdit:=TfrmENTransportOrderFilterEdit.Create(Application, dsInsert);
  try
    ENTransportOrderFilterObj := ENTransportOrderFilter.Create;
    SetNullIntProps(ENTransportOrderFilterObj);
    SetNullXSProps(ENTransportOrderFilterObj);

    if frmENTransportOrderFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTransportOrderFilter.Create;
      FilterObject := ENTransportOrderFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransportOrderFilterEdit.Free;
    frmENTransportOrderFilterEdit:=nil;
  end;}
end;

procedure TfrmENTransportOrderShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;

    if Length(strFilter) > 0 then
    begin
      FilterObject := ENTransportOrderFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
      ENTransportOrderFilter(FilterObject).conditionSQL := strFilter;
    end;
  UpdateGrid(Sender);
end;

end.