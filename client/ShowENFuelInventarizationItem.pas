
unit ShowENFuelInventarizationItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENFuelInventarizationItemController, AdvObj ;


type
  TfrmENFuelInventarizationItemShow = class(TChildForm)  
  HTTPRIOENFuelInventarizationItem: THTTPRIO;
    ImageList1: TImageList;
    sgENFuelInventarizationItem: TAdvStringGrid;
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
procedure sgENFuelInventarizationItemTopLeftChanged(Sender: TObject);
procedure sgENFuelInventarizationItemDblClick(Sender: TObject);
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
 // ENFuelInventarizationItemObj: ENFuelInventarizationItem;
 // ENFuelInventarizationItemFilterObj: ENFuelInventarizationItemFilter;
  
  
implementation

uses Main, EditENFuelInventarizationItem, EditENFuelInventarizationItemFilter;


{$R *.dfm}

var
  //frmENFuelInventarizationItemShow : TfrmENFuelInventarizationItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFuelInventarizationItemHeaders: array [1..7] of String =
        ( 'Код'
          ,'обсяг з останнього ПЛ, л.'
          ,'обсяг фактичний, л.'
          ,'Користувач, що додав строку'
          ,'Дата додавання'
          ,'Користувач, який змінив строку'
          ,'Дата зміни'
        );
   

procedure TfrmENFuelInventarizationItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFuelInventarizationItemShow:=nil;
    inherited;
  end;


procedure TfrmENFuelInventarizationItemShow.FormShow(Sender: TObject);
var
  TempENFuelInventarizationItem: ENFuelInventarizationItemControllerSoapPort;
  i: Integer;
  ENFuelInventarizationItemList: ENFuelInventarizationItemShortList;
  begin
  SetGridHeaders(ENFuelInventarizationItemHeaders, sgENFuelInventarizationItem.ColumnHeaders);
  ColCount:=100;
  TempENFuelInventarizationItem :=  HTTPRIOENFuelInventarizationItem as ENFuelInventarizationItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelInventarizationItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelInventarizationItemList := TempENFuelInventarizationItem.getScrollableFilteredList(ENFuelInventarizationItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENFuelInventarizationItemList.list);

  if LastCount > -1 then
     sgENFuelInventarizationItem.RowCount:=LastCount+2
  else
     sgENFuelInventarizationItem.RowCount:=2;

   with sgENFuelInventarizationItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelInventarizationItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFuelInventarizationItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENFuelInventarizationItemList.list[i].countGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENFuelInventarizationItemList.list[i].countGen.DecimalString;
        if ENFuelInventarizationItemList.list[i].countFact = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENFuelInventarizationItemList.list[i].countFact.DecimalString;
        Cells[3,i+1] := ENFuelInventarizationItemList.list[i].userAdd;
        if ENFuelInventarizationItemList.list[i].dateAdd = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENFuelInventarizationItemList.list[i].dateAdd);
        Cells[5,i+1] := ENFuelInventarizationItemList.list[i].userGen;
        if ENFuelInventarizationItemList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENFuelInventarizationItemList.list[i].dateEdit);

        LastRow:=i+1;
        sgENFuelInventarizationItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENFuelInventarizationItem.Row:=1;
end;

procedure TfrmENFuelInventarizationItemShow.sgENFuelInventarizationItemTopLeftChanged(Sender: TObject);
var
  TempENFuelInventarizationItem: ENFuelInventarizationItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENFuelInventarizationItemList: ENFuelInventarizationItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFuelInventarizationItem.TopRow + sgENFuelInventarizationItem.VisibleRowCount) = ColCount
  then
    begin
      TempENFuelInventarizationItem :=  HTTPRIOENFuelInventarizationItem as ENFuelInventarizationItemControllerSoapPort;
      CurrentRow:=sgENFuelInventarizationItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFuelInventarizationItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFuelInventarizationItemList := TempENFuelInventarizationItem.getScrollableFilteredList(ENFuelInventarizationItemFilter(FilterObject),ColCount-1, 100);



  sgENFuelInventarizationItem.RowCount:=sgENFuelInventarizationItem.RowCount+100;
  LastCount:=High(ENFuelInventarizationItemList.list);
  with sgENFuelInventarizationItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelInventarizationItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENFuelInventarizationItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENFuelInventarizationItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENFuelInventarizationItemList.list[i].countGen.DecimalString;
        if ENFuelInventarizationItemList.list[i].countFact = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENFuelInventarizationItemList.list[i].countFact.DecimalString;
        Cells[3,i+CurrentRow] := ENFuelInventarizationItemList.list[i].userAdd;
        if ENFuelInventarizationItemList.list[i].dateAdd = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(ENFuelInventarizationItemList.list[i].dateAdd);		  
        Cells[5,i+CurrentRow] := ENFuelInventarizationItemList.list[i].userGen;
        if ENFuelInventarizationItemList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(ENFuelInventarizationItemList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFuelInventarizationItem.Row:=CurrentRow-5;
   sgENFuelInventarizationItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFuelInventarizationItemShow.sgENFuelInventarizationItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFuelInventarizationItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFuelInventarizationItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFuelInventarizationItem.RowCount-1 do
   for j:=0 to sgENFuelInventarizationItem.ColCount-1 do
     sgENFuelInventarizationItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFuelInventarizationItemShow.actViewExecute(Sender: TObject);
Var TempENFuelInventarizationItem: ENFuelInventarizationItemControllerSoapPort;
begin
 TempENFuelInventarizationItem := HTTPRIOENFuelInventarizationItem as ENFuelInventarizationItemControllerSoapPort;
   try
     ENFuelInventarizationItemObj := TempENFuelInventarizationItem.getObject(StrToInt(sgENFuelInventarizationItem.Cells[0,sgENFuelInventarizationItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelInventarizationItemEdit:=TfrmENFuelInventarizationItemEdit.Create(Application, dsView);
  try
    frmENFuelInventarizationItemEdit.ShowModal;
  finally
    frmENFuelInventarizationItemEdit.Free;
    frmENFuelInventarizationItemEdit:=nil;
  end;
end;

procedure TfrmENFuelInventarizationItemShow.actEditExecute(Sender: TObject);
Var TempENFuelInventarizationItem: ENFuelInventarizationItemControllerSoapPort;
begin
 TempENFuelInventarizationItem := HTTPRIOENFuelInventarizationItem as ENFuelInventarizationItemControllerSoapPort;
   try
     ENFuelInventarizationItemObj := TempENFuelInventarizationItem.getObject(StrToInt(sgENFuelInventarizationItem.Cells[0,sgENFuelInventarizationItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFuelInventarizationItemEdit:=TfrmENFuelInventarizationItemEdit.Create(Application, dsEdit);
  try
    if frmENFuelInventarizationItemEdit.ShowModal= mrOk then
      begin
        //TempENFuelInventarizationItem.save(ENFuelInventarizationItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFuelInventarizationItemEdit.Free;
    frmENFuelInventarizationItemEdit:=nil;
  end;
end;

procedure TfrmENFuelInventarizationItemShow.actDeleteExecute(Sender: TObject);
Var TempENFuelInventarizationItem: ENFuelInventarizationItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFuelInventarizationItem := HTTPRIOENFuelInventarizationItem as ENFuelInventarizationItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFuelInventarizationItem.Cells[0,sgENFuelInventarizationItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строка інвентарізації палива) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFuelInventarizationItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFuelInventarizationItemShow.actInsertExecute(Sender: TObject);
// Var TempENFuelInventarizationItem: ENFuelInventarizationItemControllerSoapPort; 
begin
  // TempENFuelInventarizationItem := HTTPRIOENFuelInventarizationItem as ENFuelInventarizationItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENFuelInventarizationItemObj:=ENFuelInventarizationItem.Create;

   //ENFuelInventarizationItemObj.countGen:= TXSDecimal.Create;
   //ENFuelInventarizationItemObj.countFact:= TXSDecimal.Create;
   //ENFuelInventarizationItemObj.dateAdd:= TXSDateTime.Create;
   
   //ENFuelInventarizationItemObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENFuelInventarizationItemEdit:=TfrmENFuelInventarizationItemEdit.Create(Application, dsInsert);
    try
      if frmENFuelInventarizationItemEdit.ShowModal = mrOk then
      begin
        if ENFuelInventarizationItemObj<>nil then
            //TempENFuelInventarizationItem.add(ENFuelInventarizationItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFuelInventarizationItemEdit.Free;
      frmENFuelInventarizationItemEdit:=nil;
    end;
  finally
    ENFuelInventarizationItemObj.Free;
  end;
end;

procedure TfrmENFuelInventarizationItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFuelInventarizationItemShow.actFilterExecute(Sender: TObject);
begin
{frmENFuelInventarizationItemFilterEdit:=TfrmENFuelInventarizationItemFilterEdit.Create(Application, dsInsert);
  try
    ENFuelInventarizationItemFilterObj := ENFuelInventarizationItemFilter.Create;
    SetNullIntProps(ENFuelInventarizationItemFilterObj);
    SetNullXSProps(ENFuelInventarizationItemFilterObj);

    if frmENFuelInventarizationItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFuelInventarizationItemFilter.Create;
      FilterObject := ENFuelInventarizationItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFuelInventarizationItemFilterEdit.Free;
    frmENFuelInventarizationItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENFuelInventarizationItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.