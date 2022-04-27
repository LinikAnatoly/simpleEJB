
unit ShowENTransportItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTransportItemController, AdvObj ;


type
  TfrmENTransportItemShow = class(TChildForm)  
  HTTPRIOENTransportItem: THTTPRIO;
    ImageList1: TImageList;
    sgENTransportItem: TAdvStringGrid;
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
procedure sgENTransportItemTopLeftChanged(Sender: TObject);
procedure sgENTransportItemDblClick(Sender: TObject);
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

var
 frmENTransportItemShow : TfrmENTransportItemShow;
 // ENTransportItemObj: ENTransportItem;
 // ENTransportItemFilterObj: ENTransportItemFilter;
  
  
implementation

uses Main, EditENTransportItem, EditENTransportItemFilter;


{$R *.dfm}

var
  //frmENTransportItemShow : TfrmENTransportItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTransportItemHeaders: array [1..7] of String =
{        ( 'Код'
          ,'норма часу нормативна'
          ,'норма часу скорегована'
          ,'Ціна нормачасу'
          ,'Вартість нормочасу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
}
        ( 'Код'
          ,'держ №'
          ,'Назва'
          ,'Водій'
          //,'Нормативний тр-т'
          ,'Відстані, км'
          ,'Объект'
          ,'инв.№ Объекта'
          {
          ,'Дата виконання плана'
          ,'норма часу скорегована'
          ,'Ціна нормачасу'
          ,'Вартість нормочасу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
          }
        );

procedure TfrmENTransportItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTransportItemShow:=nil;
    inherited;
  end;


procedure TfrmENTransportItemShow.FormShow(Sender: TObject);
var
  TempENTransportItem: ENTransportItemControllerSoapPort;
  i: Integer;
  ENTransportItemList: ENTransportItemShortList;
  begin
  SetGridHeaders(ENTransportItemHeaders, sgENTransportItem.ColumnHeaders);
  ColCount:=100;
  TempENTransportItem :=  HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportItemList := TempENTransportItem.getScrollableFilteredList(ENTransportItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTransportItemList.list);

  if LastCount > -1 then
     sgENTransportItem.RowCount:=LastCount+2
  else
     sgENTransportItem.RowCount:=2;

   with sgENTransportItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTransportItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENTransportItemList.list[i].transportRealGosNumber;

        Cells[2,i+1] := ENTransportItemList.list[i].transportRealName;

        Cells[3,i+1] := ENTransportItemList.list[i].finWorkerName;

        //Cells[4,i+1] := ENTransportItemList.list[i].transportName ;
        if ENTransportItemList.list[i].distance <> nil then
          Cells[4,i+1] := ENTransportItemList.list[i].distance.DecimalString
        else
          Cells[4,i+1] := '';

        Cells[5,i+1] := ENTransportItemList.list[i].elementName ;

        Cells[6,i+1] := ENTransportItemList.list[i].elementInvNumber ;

      {
        Application.ProcessMessages;
        if ENTransportItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENTransportItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENTransportItemList.list[i].countGen.DecimalString;
        if ENTransportItemList.list[i].countFact = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENTransportItemList.list[i].countFact.DecimalString;
        if ENTransportItemList.list[i].price = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENTransportItemList.list[i].price.DecimalString;
        if ENTransportItemList.list[i].cost = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[i].cost.DecimalString;
        Cells[5,i+1] := ENTransportItemList.list[i].userGen;
        if ENTransportItemList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENTransportItemList.list[i].dateEdit);
}
        LastRow:=i+1;
        sgENTransportItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTransportItem.Row:=1;
end;

procedure TfrmENTransportItemShow.sgENTransportItemTopLeftChanged(Sender: TObject);
var
  TempENTransportItem: ENTransportItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENTransportItemList: ENTransportItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTransportItem.TopRow + sgENTransportItem.VisibleRowCount) = ColCount
  then
    begin
      TempENTransportItem :=  HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
      CurrentRow:=sgENTransportItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTransportItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTransportItemList := TempENTransportItem.getScrollableFilteredList(ENTransportItemFilter(FilterObject),ColCount-1, 100);



  sgENTransportItem.RowCount:=sgENTransportItem.RowCount+100;
  LastCount:=High(ENTransportItemList.list);
  with sgENTransportItem do
    for i:=0 to LastCount do
      begin
        if ENTransportItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENTransportItemList.list[i].transportRealGosNumber;

        Cells[2,i+CurrentRow] := ENTransportItemList.list[i].transportRealName;

        Cells[3,i+CurrentRow] := ENTransportItemList.list[i].finWorkerName;

        //Cells[4,i+CurrentRow] := ENTransportItemList.list[i].transportName ;
        if ENTransportItemList.list[i].distance <> nil then
          Cells[4,i+CurrentRow] := ENTransportItemList.list[i].distance.DecimalString
        else
          Cells[4,i+CurrentRow] := '';

        Cells[5,i+CurrentRow] := ENTransportItemList.list[i].elementName ;

        Cells[6,i+CurrentRow] := ENTransportItemList.list[i].elementInvNumber ;

      {
        Application.ProcessMessages;
        if ENTransportItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTransportItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENTransportItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENTransportItemList.list[i].countGen.DecimalString;
        if ENTransportItemList.list[i].countFact = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENTransportItemList.list[i].countFact.DecimalString;
        if ENTransportItemList.list[i].price = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENTransportItemList.list[i].price.DecimalString;
        if ENTransportItemList.list[i].cost = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENTransportItemList.list[i].cost.DecimalString;
        Cells[5,i+CurrentRow] := ENTransportItemList.list[i].userGen;
        if ENTransportItemList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDate2String(ENTransportItemList.list[i].dateEdit);
}

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTransportItem.Row:=CurrentRow-5;
   sgENTransportItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTransportItemShow.sgENTransportItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTransportItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTransportItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTransportItem.RowCount-1 do
   for j:=0 to sgENTransportItem.ColCount-1 do
     sgENTransportItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTransportItemShow.actViewExecute(Sender: TObject);
Var TempENTransportItem: ENTransportItemControllerSoapPort;
begin
 TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
   try
     ENTransportItemObj := TempENTransportItem.getObject(StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportItemEdit:=TfrmENTransportItemEdit.Create(Application, dsView);
  try
    frmENTransportItemEdit.ShowModal;
  finally
    frmENTransportItemEdit.Free;
    frmENTransportItemEdit:=nil;
  end;
end;

procedure TfrmENTransportItemShow.actEditExecute(Sender: TObject);
Var TempENTransportItem: ENTransportItemControllerSoapPort;
begin
 TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
   try
     ENTransportItemObj := TempENTransportItem.getObject(StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTransportItemEdit:=TfrmENTransportItemEdit.Create(Application, dsEdit);
  try
    if frmENTransportItemEdit.ShowModal= mrOk then
      begin
        //TempENTransportItem.save(ENTransportItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTransportItemEdit.Free;
    frmENTransportItemEdit:=nil;
  end;
end;

procedure TfrmENTransportItemShow.actDeleteExecute(Sender: TObject);
Var TempENTransportItem: ENTransportItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Транспортні ресурси) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTransportItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTransportItemShow.actInsertExecute(Sender: TObject);
Var TempENTransportItem: ENTransportItemControllerSoapPort;
begin
  TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
  ENTransportItemObj:=ENTransportItem.Create;

   ENTransportItemObj.countWorkGen:= TXSDecimal.Create;
   ENTransportItemObj.countWorkFact:= TXSDecimal.Create;
   ENTransportItemObj.price:= TXSDecimal.Create;
   ENTransportItemObj.cost:= TXSDecimal.Create;
   ENTransportItemObj.dateEdit:= TXSDate.Create;


  try
    frmENTransportItemEdit:=TfrmENTransportItemEdit.Create(Application, dsInsert);
    try
      if frmENTransportItemEdit.ShowModal = mrOk then
      begin
        if ENTransportItemObj<>nil then
            //TempENTransportItem.add(ENTransportItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportItemEdit.Free;
      frmENTransportItemEdit:=nil;
    end;
  finally
    ENTransportItemObj.Free;
  end;
end;

procedure TfrmENTransportItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTransportItemShow.actFilterExecute(Sender: TObject);
begin
{frmENTransportItemFilterEdit:=TfrmENTransportItemFilterEdit.Create(Application, dsEdit);
  try
    ENTransportItemFilterObj := ENTransportItemFilter.Create;
    SetNullIntProps(ENTransportItemFilterObj);
    SetNullXSProps(ENTransportItemFilterObj);

    if frmENTransportItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTransportItemFilter.Create;
      FilterObject := ENTransportItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTransportItemFilterEdit.Free;
    frmENTransportItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENTransportItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.