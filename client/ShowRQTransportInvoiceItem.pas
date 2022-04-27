
unit ShowRQTransportInvoiceItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQTransportInvoiceItemController ;


type
  TfrmRQTransportInvoiceItemShow = class(TChildForm)  
  HTTPRIORQTransportInvoiceItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQTransportInvoiceItem: TAdvStringGrid;
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
procedure sgRQTransportInvoiceItemTopLeftChanged(Sender: TObject);
procedure sgRQTransportInvoiceItemDblClick(Sender: TObject);
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
 // RQTransportInvoiceItemObj: RQTransportInvoiceItem;
 // RQTransportInvoiceItemFilterObj: RQTransportInvoiceItemFilter;
  
  
implementation

uses Main, EditRQTransportInvoiceItem, EditRQTransportInvoiceItemFilter;


{$R *.dfm}

var
  //frmRQTransportInvoiceItemShow : TfrmRQTransportInvoiceItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQTransportInvoiceItemHeaders: array [1..7] of String =
        ( 'Код'
          ,'Назва материалу'
          ,'Од. виміру материалу'
          ,'кількість'
          ,'Вага, кг'
          ,'Примітка'
          ,'користувач який вніс зміни'
        );
   

procedure TfrmRQTransportInvoiceItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQTransportInvoiceItemShow:=nil;
    inherited;
  end;


procedure TfrmRQTransportInvoiceItemShow.FormShow(Sender: TObject);
var
  TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort;
  i: Integer;
  RQTransportInvoiceItemList: RQTransportInvoiceItemShortList;
  begin
  SetGridHeaders(RQTransportInvoiceItemHeaders, sgRQTransportInvoiceItem.ColumnHeaders);
  ColCount:=100;
  TempRQTransportInvoiceItem :=  HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQTransportInvoiceItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQTransportInvoiceItemList := TempRQTransportInvoiceItem.getScrollableFilteredList(RQTransportInvoiceItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQTransportInvoiceItemList.list);

  if LastCount > -1 then
     sgRQTransportInvoiceItem.RowCount:=LastCount+2
  else
     sgRQTransportInvoiceItem.RowCount:=2;

   with sgRQTransportInvoiceItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQTransportInvoiceItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQTransportInvoiceItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQTransportInvoiceItemList.list[i].materialName;
        Cells[2,i+1] := RQTransportInvoiceItemList.list[i].measurementName;
        if RQTransportInvoiceItemList.list[i].countFact = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := RQTransportInvoiceItemList.list[i].countFact.DecimalString;
        if RQTransportInvoiceItemList.list[i].weight = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQTransportInvoiceItemList.list[i].weight.DecimalString;
        Cells[5,i+1] := RQTransportInvoiceItemList.list[i].commentGen;
        Cells[6,i+1] := RQTransportInvoiceItemList.list[i].userGen;
        LastRow:=i+1;
        sgRQTransportInvoiceItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQTransportInvoiceItem.Row:=1;
end;

procedure TfrmRQTransportInvoiceItemShow.sgRQTransportInvoiceItemTopLeftChanged(Sender: TObject);
var
  TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQTransportInvoiceItemList: RQTransportInvoiceItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQTransportInvoiceItem.TopRow + sgRQTransportInvoiceItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQTransportInvoiceItem :=  HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;
      CurrentRow:=sgRQTransportInvoiceItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQTransportInvoiceItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQTransportInvoiceItemList := TempRQTransportInvoiceItem.getScrollableFilteredList(RQTransportInvoiceItemFilter(FilterObject),ColCount-1, 100);



  sgRQTransportInvoiceItem.RowCount:=sgRQTransportInvoiceItem.RowCount+100;
  LastCount:=High(RQTransportInvoiceItemList.list);
  with sgRQTransportInvoiceItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQTransportInvoiceItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQTransportInvoiceItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQTransportInvoiceItemList.list[i].materialName;
        Cells[2,i+CurrentRow] := RQTransportInvoiceItemList.list[i].measurementName;
        if RQTransportInvoiceItemList.list[i].countFact = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := RQTransportInvoiceItemList.list[i].countFact.DecimalString;
        if RQTransportInvoiceItemList.list[i].weight = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := RQTransportInvoiceItemList.list[i].weight.DecimalString;
        Cells[5,i+CurrentRow] := RQTransportInvoiceItemList.list[i].commentGen;
        Cells[6,i+CurrentRow] := RQTransportInvoiceItemList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQTransportInvoiceItem.Row:=CurrentRow-5;
   sgRQTransportInvoiceItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQTransportInvoiceItemShow.sgRQTransportInvoiceItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQTransportInvoiceItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQTransportInvoiceItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQTransportInvoiceItem.RowCount-1 do
   for j:=0 to sgRQTransportInvoiceItem.ColCount-1 do
     sgRQTransportInvoiceItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQTransportInvoiceItemShow.actViewExecute(Sender: TObject);
Var TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort;
begin
 TempRQTransportInvoiceItem := HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;
   try
     RQTransportInvoiceItemObj := TempRQTransportInvoiceItem.getObject(StrToInt(sgRQTransportInvoiceItem.Cells[0,sgRQTransportInvoiceItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQTransportInvoiceItemEdit:=TfrmRQTransportInvoiceItemEdit.Create(Application, dsView);
  try
    frmRQTransportInvoiceItemEdit.ShowModal;
  finally
    frmRQTransportInvoiceItemEdit.Free;
    frmRQTransportInvoiceItemEdit:=nil;
  end;
end;

procedure TfrmRQTransportInvoiceItemShow.actEditExecute(Sender: TObject);
Var TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort;
begin
 TempRQTransportInvoiceItem := HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;
   try
     RQTransportInvoiceItemObj := TempRQTransportInvoiceItem.getObject(StrToInt(sgRQTransportInvoiceItem.Cells[0,sgRQTransportInvoiceItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQTransportInvoiceItemEdit:=TfrmRQTransportInvoiceItemEdit.Create(Application, dsEdit);
  try
    if frmRQTransportInvoiceItemEdit.ShowModal= mrOk then
      begin
        //TempRQTransportInvoiceItem.save(RQTransportInvoiceItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQTransportInvoiceItemEdit.Free;
    frmRQTransportInvoiceItemEdit:=nil;
  end;
end;

procedure TfrmRQTransportInvoiceItemShow.actDeleteExecute(Sender: TObject);
Var TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQTransportInvoiceItem := HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQTransportInvoiceItem.Cells[0,sgRQTransportInvoiceItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Пункти т/т накладної) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQTransportInvoiceItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQTransportInvoiceItemShow.actInsertExecute(Sender: TObject);
// Var TempRQTransportInvoiceItem: RQTransportInvoiceItemControllerSoapPort; 
begin
  // TempRQTransportInvoiceItem := HTTPRIORQTransportInvoiceItem as RQTransportInvoiceItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQTransportInvoiceItemObj:=RQTransportInvoiceItem.Create;

   //RQTransportInvoiceItemObj.countFact:= TXSDecimal.Create;
   //RQTransportInvoiceItemObj.weight:= TXSDecimal.Create;
   //RQTransportInvoiceItemObj.dateEdit:= TXSDate.Create;


  try
    frmRQTransportInvoiceItemEdit:=TfrmRQTransportInvoiceItemEdit.Create(Application, dsInsert);
    try
      if frmRQTransportInvoiceItemEdit.ShowModal = mrOk then
      begin
        if RQTransportInvoiceItemObj<>nil then
            //TempRQTransportInvoiceItem.add(RQTransportInvoiceItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQTransportInvoiceItemEdit.Free;
      frmRQTransportInvoiceItemEdit:=nil;
    end;
  finally
    RQTransportInvoiceItemObj.Free;
  end;
end;

procedure TfrmRQTransportInvoiceItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQTransportInvoiceItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQTransportInvoiceItemFilterEdit:=TfrmRQTransportInvoiceItemFilterEdit.Create(Application, dsInsert);
  try
    RQTransportInvoiceItemFilterObj := RQTransportInvoiceItemFilter.Create;
    SetNullIntProps(RQTransportInvoiceItemFilterObj);
    SetNullXSProps(RQTransportInvoiceItemFilterObj);

    if frmRQTransportInvoiceItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQTransportInvoiceItemFilter.Create;
      FilterObject := RQTransportInvoiceItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQTransportInvoiceItemFilterEdit.Free;
    frmRQTransportInvoiceItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQTransportInvoiceItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.