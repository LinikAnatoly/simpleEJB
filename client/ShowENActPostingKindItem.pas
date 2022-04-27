
unit ShowENActPostingKindItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENActPostingKindItemController, AdvObj ;


type
    TfrmENActPostingKindItemShow = class(TChildForm)  
    HTTPRIOENActPostingKindItem: THTTPRIO;
    ImageList1: TImageList;
    sgENActPostingKindItem: TAdvStringGrid;
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
    procedure sgENActPostingKindItemTopLeftChanged(Sender: TObject);
    procedure sgENActPostingKindItemDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENActPostingKindItemShort; stdcall; static;
 end;


var
  frmENActPostingKindItemShow: TfrmENActPostingKindItemShow;
  
  
implementation

uses Main, EditENActPostingKindItem, EditENActPostingKindItemFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActPostingKindItemHeaders: array [1..10] of String =
        ( 'Код'
          ,'Цех кредит '
          ,'Рахунок кредит '
          ,'кау кредит '
          ,'Цех дебет '
          ,'Рахунок дебет '
          ,'кау дебет '
          ,'Сумма (для шорт листа (просмотр сформ проводок))'
          ,'Знак для типа суммы(+/-)'
          ,'Призначення проводки'
        );
   
class function TfrmENActPostingKindItemShow.chooseFromList : ENActPostingKindItemShort;
var
  f1 : ENActPostingKindItemFilter;
  frmENActPostingKindItemShow : TfrmENActPostingKindItemShow;
  selected : ENActPostingKindItemShort;
begin
  inherited;
     selected := nil;
     f1 := ENActPostingKindItemFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENActPostingKindItemShow := TfrmENActPostingKindItemShow.Create(Application, fmNormal, f1);
       try
          with frmENActPostingKindItemShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENActPostingKindItemShort(sgENActPostingKindItem.Objects[0, sgENActPostingKindItem.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENActPostingKindItemShow.Free;
       end;
end;

procedure TfrmENActPostingKindItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENActPostingKindItemShow:=nil;
  inherited;
end;


procedure TfrmENActPostingKindItemShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENActPostingKindItemShow.FormShow(Sender: TObject);
var
  TempENActPostingKindItem: ENActPostingKindItemControllerSoapPort;
  i: Integer;
  ENActPostingKindItemList: ENActPostingKindItemShortList;
begin
  SetGridHeaders(ENActPostingKindItemHeaders, sgENActPostingKindItem.ColumnHeaders);
  ColCount:=100;
  TempENActPostingKindItem :=  HTTPRIOENActPostingKindItem as ENActPostingKindItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActPostingKindItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActPostingKindItemList := TempENActPostingKindItem.getScrollableFilteredList(ENActPostingKindItemFilter(FilterObject),0,ColCount);
  LastCount:=High(ENActPostingKindItemList.list);

  if LastCount > -1 then
     sgENActPostingKindItem.RowCount:=LastCount+2
  else
     sgENActPostingKindItem.RowCount:=2;

   with sgENActPostingKindItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActPostingKindItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActPostingKindItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActPostingKindItemList.list[i].cehKt;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[2,i+1] := ENActPostingKindItemList.list[i].accountKt;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[3,i+1] := ENActPostingKindItemList.list[i].kauKt;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[4,i+1] := ENActPostingKindItemList.list[i].cehDt;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[5,i+1] := ENActPostingKindItemList.list[i].accountDt;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[6,i+1] := ENActPostingKindItemList.list[i].kauDt;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        if ENActPostingKindItemList.list[i].summaGen = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENActPostingKindItemList.list[i].summaGen.DecimalString;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[8,i+1] := ENActPostingKindItemList.list[i].plusMinus;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[9,i+1] := ENActPostingKindItemList.list[i].description;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        LastRow:=i+1;
        sgENActPostingKindItem.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENActPostingKindItem.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENActPostingKindItem.RowCount > selectedRow then
      sgENActPostingKindItem.Row := selectedRow
    else
      sgENActPostingKindItem.Row := sgENActPostingKindItem.RowCount - 1;
    end
    else
      sgENActPostingKindItem.Row:=1;   
end;


procedure TfrmENActPostingKindItemShow.sgENActPostingKindItemTopLeftChanged(Sender: TObject);
var
  TempENActPostingKindItem: ENActPostingKindItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENActPostingKindItemList: ENActPostingKindItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActPostingKindItem.TopRow + sgENActPostingKindItem.VisibleRowCount) = ColCount
  then
    begin
      TempENActPostingKindItem :=  HTTPRIOENActPostingKindItem as ENActPostingKindItemControllerSoapPort;
      CurrentRow:=sgENActPostingKindItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActPostingKindItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActPostingKindItemList := TempENActPostingKindItem.getScrollableFilteredList(ENActPostingKindItemFilter(FilterObject),ColCount-1, 100);


  sgENActPostingKindItem.RowCount:=sgENActPostingKindItem.RowCount+100;
  LastCount:=High(ENActPostingKindItemList.list);
  with sgENActPostingKindItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActPostingKindItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActPostingKindItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActPostingKindItemList.list[i].cehKt;
        Objects[0, i+CurrentRow] := ENActPostingKindItemList.list[i];
        Cells[2,i+CurrentRow] := ENActPostingKindItemList.list[i].accountKt;
        Objects[0, i+CurrentRow] := ENActPostingKindItemList.list[i];
        Cells[3,i+CurrentRow] := ENActPostingKindItemList.list[i].kauKt;
        Objects[0, i+CurrentRow] := ENActPostingKindItemList.list[i];
        Cells[4,i+CurrentRow] := ENActPostingKindItemList.list[i].cehDt;
        Objects[0, i+CurrentRow] := ENActPostingKindItemList.list[i];
        Cells[5,i+CurrentRow] := ENActPostingKindItemList.list[i].accountDt;
        Objects[0, i+CurrentRow] := ENActPostingKindItemList.list[i];
        Cells[6,i+CurrentRow] := ENActPostingKindItemList.list[i].kauDt;
        Objects[0, i+CurrentRow] := ENActPostingKindItemList.list[i];
        if ENActPostingKindItemList.list[i].summaGen = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ENActPostingKindItemList.list[i].summaGen.DecimalString;
        Objects[0, i+CurrentRow] := ENActPostingKindItemList.list[i];
        Cells[8,i+CurrentRow] := ENActPostingKindItemList.list[i].plusMinus;
        Objects[0, i+CurrentRow] := ENActPostingKindItemList.list[i];
        Cells[9,i+CurrentRow] := ENActPostingKindItemList.list[i].description;
        Objects[0, i+CurrentRow] := ENActPostingKindItemList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActPostingKindItem.Row:=CurrentRow-5;
   sgENActPostingKindItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActPostingKindItemShow.sgENActPostingKindItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActPostingKindItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENActPostingKindItemShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENActPostingKindItem.RowCount-1 do
   for j:=0 to sgENActPostingKindItem.ColCount-1 do
     sgENActPostingKindItem.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENActPostingKindItemShow.actViewExecute(Sender: TObject);
var 
  TempENActPostingKindItem: ENActPostingKindItemControllerSoapPort;
begin
  TempENActPostingKindItem := HTTPRIOENActPostingKindItem as ENActPostingKindItemControllerSoapPort;
  try
    ENActPostingKindItemObj := TempENActPostingKindItem.getObject(StrToInt(sgENActPostingKindItem.Cells[0, sgENActPostingKindItem.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENActPostingKindItemEdit := TfrmENActPostingKindItemEdit.Create(Application, dsView);
  try
    frmENActPostingKindItemEdit.ShowModal;
  finally
    frmENActPostingKindItemEdit.Free;
    frmENActPostingKindItemEdit := nil;
  end;
end;


procedure TfrmENActPostingKindItemShow.actEditExecute(Sender: TObject);
var 
  TempENActPostingKindItem: ENActPostingKindItemControllerSoapPort;
begin
  TempENActPostingKindItem := HTTPRIOENActPostingKindItem as ENActPostingKindItemControllerSoapPort;
  try
    ENActPostingKindItemObj := TempENActPostingKindItem.getObject(StrToInt(sgENActPostingKindItem.Cells[0,sgENActPostingKindItem.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENActPostingKindItem.Row;
  frmENActPostingKindItemEdit:=TfrmENActPostingKindItemEdit.Create(Application, dsEdit);
  
  try
    if frmENActPostingKindItemEdit.ShowModal= mrOk then
      begin
        //TempENActPostingKindItem.save(ENActPostingKindItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActPostingKindItemEdit.Free;
    frmENActPostingKindItemEdit:=nil;
  end;

  if sgENActPostingKindItem.RowCount > selectedRow then
    sgENActPostingKindItem.Row := selectedRow
  else
    sgENActPostingKindItem.Row := sgENActPostingKindItem.RowCount - 1;
  
end;


procedure TfrmENActPostingKindItemShow.actDeleteExecute(Sender: TObject);
Var TempENActPostingKindItem: ENActPostingKindItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActPostingKindItem := HTTPRIOENActPostingKindItem as ENActPostingKindItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActPostingKindItem.Cells[0,sgENActPostingKindItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Строки шаблона проводок )?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActPostingKindItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActPostingKindItemShow.actInsertExecute(Sender: TObject);
// Var TempENActPostingKindItem: ENActPostingKindItemControllerSoapPort; 
begin
  // TempENActPostingKindItem := HTTPRIOENActPostingKindItem as ENActPostingKindItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENActPostingKindItemObj:=ENActPostingKindItem.Create;
  SetNullIntProps(ENActPostingKindItemObj);
  SetNullXSProps(ENActPostingKindItemObj);

   //ENActPostingKindItemObj.summaGen:= TXSDecimal.Create;


  try
    frmENActPostingKindItemEdit:=TfrmENActPostingKindItemEdit.Create(Application, dsInsert);
    try
      if frmENActPostingKindItemEdit.ShowModal = mrOk then
      begin
        if ENActPostingKindItemObj<>nil then
            //TempENActPostingKindItem.add(ENActPostingKindItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENActPostingKindItemEdit.Free;
      frmENActPostingKindItemEdit:=nil;
    end;
  finally
    ENActPostingKindItemObj.Free;
  end;
end;


procedure TfrmENActPostingKindItemShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENActPostingKindItemShow.actFilterExecute(Sender: TObject);
begin
{frmENActPostingKindItemFilterEdit:=TfrmENActPostingKindItemFilterEdit.Create(Application, dsInsert);
  try
    ENActPostingKindItemFilterObj := ENActPostingKindItemFilter.Create;
    SetNullIntProps(ENActPostingKindItemFilterObj);
    SetNullXSProps(ENActPostingKindItemFilterObj);

    if frmENActPostingKindItemFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENActPostingKindItemFilter.Create;
      FilterObject := ENActPostingKindItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActPostingKindItemFilterEdit.Free;
    frmENActPostingKindItemFilterEdit:=nil;
  end;}
end;


procedure TfrmENActPostingKindItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.