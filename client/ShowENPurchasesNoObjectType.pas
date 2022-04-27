
unit ShowENPurchasesNoObjectType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPurchasesNoObjectTypeController ;


type
  TfrmENPurchasesNoObjectTypeShow = class(TChildForm)  
  HTTPRIOENPurchasesNoObjectType: THTTPRIO;
    ImageList1: TImageList;
    sgENPurchasesNoObjectType: TAdvStringGrid;
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
procedure sgENPurchasesNoObjectTypeTopLeftChanged(Sender: TObject);
procedure sgENPurchasesNoObjectTypeDblClick(Sender: TObject);
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
 // ENPurchasesNoObjectTypeObj: ENPurchasesNoObjectType;
 // ENPurchasesNoObjectTypeFilterObj: ENPurchasesNoObjectTypeFilter;
  
  
implementation

uses Main, EditENPurchasesNoObjectType, EditENPurchasesNoObjectTypeFilter;


{$R *.dfm}

var
  //frmENPurchasesNoObjectTypeShow : TfrmENPurchasesNoObjectTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPurchasesNoObjectTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENPurchasesNoObjectTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPurchasesNoObjectTypeShow:=nil;
    inherited;
  end;


procedure TfrmENPurchasesNoObjectTypeShow.FormShow(Sender: TObject);
var
  TempENPurchasesNoObjectType: ENPurchasesNoObjectTypeControllerSoapPort;
  i: Integer;
  ENPurchasesNoObjectTypeList: ENPurchasesNoObjectTypeShortList;
  begin
  SetGridHeaders(ENPurchasesNoObjectTypeHeaders, sgENPurchasesNoObjectType.ColumnHeaders);
  ColCount:=100;
  TempENPurchasesNoObjectType :=  HTTPRIOENPurchasesNoObjectType as ENPurchasesNoObjectTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPurchasesNoObjectTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPurchasesNoObjectTypeList := TempENPurchasesNoObjectType.getScrollableFilteredList(ENPurchasesNoObjectTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPurchasesNoObjectTypeList.list);

  if LastCount > -1 then
     sgENPurchasesNoObjectType.RowCount:=LastCount+2
  else
     sgENPurchasesNoObjectType.RowCount:=2;

   with sgENPurchasesNoObjectType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPurchasesNoObjectTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPurchasesNoObjectTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPurchasesNoObjectTypeList.list[i].name;
        LastRow:=i+1;
        sgENPurchasesNoObjectType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPurchasesNoObjectType.Row:=1;
end;

procedure TfrmENPurchasesNoObjectTypeShow.sgENPurchasesNoObjectTypeTopLeftChanged(Sender: TObject);
var
  TempENPurchasesNoObjectType: ENPurchasesNoObjectTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENPurchasesNoObjectTypeList: ENPurchasesNoObjectTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPurchasesNoObjectType.TopRow + sgENPurchasesNoObjectType.VisibleRowCount) = ColCount
  then
    begin
      TempENPurchasesNoObjectType :=  HTTPRIOENPurchasesNoObjectType as ENPurchasesNoObjectTypeControllerSoapPort;
      CurrentRow:=sgENPurchasesNoObjectType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPurchasesNoObjectTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPurchasesNoObjectTypeList := TempENPurchasesNoObjectType.getScrollableFilteredList(ENPurchasesNoObjectTypeFilter(FilterObject),ColCount-1, 100);



  sgENPurchasesNoObjectType.RowCount:=sgENPurchasesNoObjectType.RowCount+100;
  LastCount:=High(ENPurchasesNoObjectTypeList.list);
  with sgENPurchasesNoObjectType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPurchasesNoObjectTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPurchasesNoObjectTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPurchasesNoObjectTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPurchasesNoObjectType.Row:=CurrentRow-5;
   sgENPurchasesNoObjectType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPurchasesNoObjectTypeShow.sgENPurchasesNoObjectTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPurchasesNoObjectType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPurchasesNoObjectTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPurchasesNoObjectType.RowCount-1 do
   for j:=0 to sgENPurchasesNoObjectType.ColCount-1 do
     sgENPurchasesNoObjectType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPurchasesNoObjectTypeShow.actViewExecute(Sender: TObject);
Var TempENPurchasesNoObjectType: ENPurchasesNoObjectTypeControllerSoapPort;
begin
 TempENPurchasesNoObjectType := HTTPRIOENPurchasesNoObjectType as ENPurchasesNoObjectTypeControllerSoapPort;
   try
     ENPurchasesNoObjectTypeObj := TempENPurchasesNoObjectType.getObject(StrToInt(sgENPurchasesNoObjectType.Cells[0,sgENPurchasesNoObjectType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPurchasesNoObjectTypeEdit:=TfrmENPurchasesNoObjectTypeEdit.Create(Application, dsView);
  try
    frmENPurchasesNoObjectTypeEdit.ShowModal;
  finally
    frmENPurchasesNoObjectTypeEdit.Free;
    frmENPurchasesNoObjectTypeEdit:=nil;
  end;
end;

procedure TfrmENPurchasesNoObjectTypeShow.actEditExecute(Sender: TObject);
Var TempENPurchasesNoObjectType: ENPurchasesNoObjectTypeControllerSoapPort;
begin
 TempENPurchasesNoObjectType := HTTPRIOENPurchasesNoObjectType as ENPurchasesNoObjectTypeControllerSoapPort;
   try
     ENPurchasesNoObjectTypeObj := TempENPurchasesNoObjectType.getObject(StrToInt(sgENPurchasesNoObjectType.Cells[0,sgENPurchasesNoObjectType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPurchasesNoObjectTypeEdit:=TfrmENPurchasesNoObjectTypeEdit.Create(Application, dsEdit);
  try
    if frmENPurchasesNoObjectTypeEdit.ShowModal= mrOk then
      begin
        //TempENPurchasesNoObjectType.save(ENPurchasesNoObjectTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPurchasesNoObjectTypeEdit.Free;
    frmENPurchasesNoObjectTypeEdit:=nil;
  end;
end;

procedure TfrmENPurchasesNoObjectTypeShow.actDeleteExecute(Sender: TObject);
Var TempENPurchasesNoObjectType: ENPurchasesNoObjectTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPurchasesNoObjectType := HTTPRIOENPurchasesNoObjectType as ENPurchasesNoObjectTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPurchasesNoObjectType.Cells[0,sgENPurchasesNoObjectType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи безобьектних обьєктів (закупівлі/списання)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPurchasesNoObjectType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPurchasesNoObjectTypeShow.actInsertExecute(Sender: TObject);
Var TempENPurchasesNoObjectType: ENPurchasesNoObjectTypeControllerSoapPort;
begin
  TempENPurchasesNoObjectType := HTTPRIOENPurchasesNoObjectType as ENPurchasesNoObjectTypeControllerSoapPort;
  ENPurchasesNoObjectTypeObj:=ENPurchasesNoObjectType.Create;



  try
    frmENPurchasesNoObjectTypeEdit:=TfrmENPurchasesNoObjectTypeEdit.Create(Application, dsInsert);
    try
      if frmENPurchasesNoObjectTypeEdit.ShowModal = mrOk then
      begin
        if ENPurchasesNoObjectTypeObj<>nil then
            //TempENPurchasesNoObjectType.add(ENPurchasesNoObjectTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPurchasesNoObjectTypeEdit.Free;
      frmENPurchasesNoObjectTypeEdit:=nil;
    end;
  finally
    ENPurchasesNoObjectTypeObj.Free;
  end;
end;

procedure TfrmENPurchasesNoObjectTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPurchasesNoObjectTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENPurchasesNoObjectTypeFilterEdit:=TfrmENPurchasesNoObjectTypeFilterEdit.Create(Application, dsEdit);
  try
    ENPurchasesNoObjectTypeFilterObj := ENPurchasesNoObjectTypeFilter.Create;
    SetNullIntProps(ENPurchasesNoObjectTypeFilterObj);
    SetNullXSProps(ENPurchasesNoObjectTypeFilterObj);

    if frmENPurchasesNoObjectTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPurchasesNoObjectTypeFilter.Create;
      FilterObject := ENPurchasesNoObjectTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPurchasesNoObjectTypeFilterEdit.Free;
    frmENPurchasesNoObjectTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENPurchasesNoObjectTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.