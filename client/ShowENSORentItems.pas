
unit ShowENSORentItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSORentItemsController, AdvObj ;


type
  TfrmENSORentItemsShow = class(TChildForm)  
  HTTPRIOENSORentItems: THTTPRIO;
    ImageList1: TImageList;
    sgENSORentItems: TAdvStringGrid;
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
procedure sgENSORentItemsTopLeftChanged(Sender: TObject);
procedure sgENSORentItemsDblClick(Sender: TObject);
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
 // ENSORentItemsObj: ENSORentItems;
 // ENSORentItemsFilterObj: ENSORentItemsFilter;
  
  
implementation

uses Main, EditENSORentItems, EditENSORentItemsFilter;


{$R *.dfm}

var
  //frmENSORentItemsShow : TfrmENSORentItemsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSORentItemsHeaders: array [1..8] of String =
        ( 'Код'
          ,'Назва населеного пункту'
          ,'Номери опор лінії'
          ,'Довжина лінії сумісного підвісу'
          ,'Призначення лінії сумісного підвісу'
          ,'Марка проводу лінії сумісного підвісу Замовника'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENSORentItemsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSORentItemsShow:=nil;
    inherited;
  end;


procedure TfrmENSORentItemsShow.FormShow(Sender: TObject);
var
  TempENSORentItems: ENSORentItemsControllerSoapPort;
  i: Integer;
  ENSORentItemsList: ENSORentItemsShortList;
  begin
  SetGridHeaders(ENSORentItemsHeaders, sgENSORentItems.ColumnHeaders);
  ColCount:=100;
  TempENSORentItems :=  HTTPRIOENSORentItems as ENSORentItemsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSORentItemsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSORentItemsList := TempENSORentItems.getScrollableFilteredList(ENSORentItemsFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSORentItemsList.list);

  if LastCount > -1 then
     sgENSORentItems.RowCount:=LastCount+2
  else
     sgENSORentItems.RowCount:=2;

   with sgENSORentItems do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSORentItemsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSORentItemsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSORentItemsList.list[i].localityName;
       
        Cells[6,i+1] := ENSORentItemsList.list[i].userGen;
        if ENSORentItemsList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(ENSORentItemsList.list[i].dateEdit);
        LastRow:=i+1;
        sgENSORentItems.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSORentItems.Row:=1;
end;

procedure TfrmENSORentItemsShow.sgENSORentItemsTopLeftChanged(Sender: TObject);
var
  TempENSORentItems: ENSORentItemsControllerSoapPort;
  i,CurrentRow: Integer;
  ENSORentItemsList: ENSORentItemsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSORentItems.TopRow + sgENSORentItems.VisibleRowCount) = ColCount
  then
    begin
      TempENSORentItems :=  HTTPRIOENSORentItems as ENSORentItemsControllerSoapPort;
      CurrentRow:=sgENSORentItems.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSORentItemsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSORentItemsList := TempENSORentItems.getScrollableFilteredList(ENSORentItemsFilter(FilterObject),ColCount-1, 100);



  sgENSORentItems.RowCount:=sgENSORentItems.RowCount+100;
  LastCount:=High(ENSORentItemsList.list);
  with sgENSORentItems do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSORentItemsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSORentItemsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSORentItemsList.list[i].localityName;
        
        Cells[6,i+CurrentRow] := ENSORentItemsList.list[i].userGen;
        if ENSORentItemsList.list[i].dateEdit = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDateTimeWithDate2String(ENSORentItemsList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSORentItems.Row:=CurrentRow-5;
   sgENSORentItems.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSORentItemsShow.sgENSORentItemsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSORentItems,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSORentItemsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSORentItems.RowCount-1 do
   for j:=0 to sgENSORentItems.ColCount-1 do
     sgENSORentItems.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSORentItemsShow.actViewExecute(Sender: TObject);
Var TempENSORentItems: ENSORentItemsControllerSoapPort;
begin
 TempENSORentItems := HTTPRIOENSORentItems as ENSORentItemsControllerSoapPort;
   try
     ENSORentItemsObj := TempENSORentItems.getObject(StrToInt(sgENSORentItems.Cells[0,sgENSORentItems.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSORentItemsEdit:=TfrmENSORentItemsEdit.Create(Application, dsView);
  try
    frmENSORentItemsEdit.ShowModal;
  finally
    frmENSORentItemsEdit.Free;
    frmENSORentItemsEdit:=nil;
  end;
end;

procedure TfrmENSORentItemsShow.actEditExecute(Sender: TObject);
Var TempENSORentItems: ENSORentItemsControllerSoapPort;
begin
 TempENSORentItems := HTTPRIOENSORentItems as ENSORentItemsControllerSoapPort;
   try
     ENSORentItemsObj := TempENSORentItems.getObject(StrToInt(sgENSORentItems.Cells[0,sgENSORentItems.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSORentItemsEdit:=TfrmENSORentItemsEdit.Create(Application, dsEdit);
  try
    if frmENSORentItemsEdit.ShowModal= mrOk then
      begin
        //TempENSORentItems.save(ENSORentItemsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSORentItemsEdit.Free;
    frmENSORentItemsEdit:=nil;
  end;
end;

procedure TfrmENSORentItemsShow.actDeleteExecute(Sender: TObject);
Var TempENSORentItems: ENSORentItemsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSORentItems := HTTPRIOENSORentItems as ENSORentItemsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSORentItems.Cells[0,sgENSORentItems.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки ліній сумісного підвісу по договору) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSORentItems.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSORentItemsShow.actInsertExecute(Sender: TObject);
// Var TempENSORentItems: ENSORentItemsControllerSoapPort; 
begin
  // TempENSORentItems := HTTPRIOENSORentItems as ENSORentItemsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSORentItemsObj:=ENSORentItems.Create;

   //ENSORentItemsObj.jointLineLenght:= TXSDecimal.Create;
   //ENSORentItemsObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENSORentItemsEdit:=TfrmENSORentItemsEdit.Create(Application, dsInsert);
    try
      if frmENSORentItemsEdit.ShowModal = mrOk then
      begin
        if ENSORentItemsObj<>nil then
            //TempENSORentItems.add(ENSORentItemsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSORentItemsEdit.Free;
      frmENSORentItemsEdit:=nil;
    end;
  finally
    ENSORentItemsObj.Free;
  end;
end;

procedure TfrmENSORentItemsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSORentItemsShow.actFilterExecute(Sender: TObject);
begin
{frmENSORentItemsFilterEdit:=TfrmENSORentItemsFilterEdit.Create(Application, dsInsert);
  try
    ENSORentItemsFilterObj := ENSORentItemsFilter.Create;
    SetNullIntProps(ENSORentItemsFilterObj);
    SetNullXSProps(ENSORentItemsFilterObj);

    if frmENSORentItemsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSORentItemsFilter.Create;
      FilterObject := ENSORentItemsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSORentItemsFilterEdit.Free;
    frmENSORentItemsFilterEdit:=nil;
  end;}
end;

procedure TfrmENSORentItemsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.