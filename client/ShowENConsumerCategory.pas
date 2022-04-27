
unit ShowENConsumerCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENConsumerCategoryController, AdvObj ;


type
  TfrmENConsumerCategoryShow = class(TChildForm)  
  HTTPRIOENConsumerCategory: THTTPRIO;
    ImageList1: TImageList;
    sgENConsumerCategory: TAdvStringGrid;
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
procedure sgENConsumerCategoryTopLeftChanged(Sender: TObject);
procedure sgENConsumerCategoryDblClick(Sender: TObject);
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
 frmENConsumerCategoryShow : TfrmENConsumerCategoryShow;
 // ENConsumerCategoryObj: ENConsumerCategory;
 // ENConsumerCategoryFilterObj: ENConsumerCategoryFilter;
  
  
implementation

uses Main, EditENConsumerCategory, EditENConsumerCategoryFilter;


{$R *.dfm}

var
  //frmENConsumerCategoryShow : TfrmENConsumerCategoryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENConsumerCategoryHeaders: array [1..2] of String =
        ( 'Код'
          ,'Категория потребителя'
        );
   

procedure TfrmENConsumerCategoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENConsumerCategoryShow:=nil;
    inherited;
  end;


procedure TfrmENConsumerCategoryShow.FormShow(Sender: TObject);
var
  TempENConsumerCategory: ENConsumerCategoryControllerSoapPort;
  i: Integer;
  ENConsumerCategoryList: ENConsumerCategoryShortList;
  begin
  SetGridHeaders(ENConsumerCategoryHeaders, sgENConsumerCategory.ColumnHeaders);
  ColCount:=100;
  TempENConsumerCategory :=  HTTPRIOENConsumerCategory as ENConsumerCategoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENConsumerCategoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConsumerCategoryList := TempENConsumerCategory.getScrollableFilteredList(ENConsumerCategoryFilter(FilterObject),0,ColCount);


  LastCount:=High(ENConsumerCategoryList.list);

  if LastCount > -1 then
     sgENConsumerCategory.RowCount:=LastCount+2
  else
     sgENConsumerCategory.RowCount:=2;

   with sgENConsumerCategory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConsumerCategoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENConsumerCategoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENConsumerCategoryList.list[i].name;
        LastRow:=i+1;
        sgENConsumerCategory.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENConsumerCategory.Row:=1;
end;

procedure TfrmENConsumerCategoryShow.sgENConsumerCategoryTopLeftChanged(Sender: TObject);
var
  TempENConsumerCategory: ENConsumerCategoryControllerSoapPort;
  i,CurrentRow: Integer;
  ENConsumerCategoryList: ENConsumerCategoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENConsumerCategory.TopRow + sgENConsumerCategory.VisibleRowCount) = ColCount
  then
    begin
      TempENConsumerCategory :=  HTTPRIOENConsumerCategory as ENConsumerCategoryControllerSoapPort;
      CurrentRow:=sgENConsumerCategory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENConsumerCategoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENConsumerCategoryList := TempENConsumerCategory.getScrollableFilteredList(ENConsumerCategoryFilter(FilterObject),ColCount-1, 100);



  sgENConsumerCategory.RowCount:=sgENConsumerCategory.RowCount+100;
  LastCount:=High(ENConsumerCategoryList.list);
  with sgENConsumerCategory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENConsumerCategoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENConsumerCategoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENConsumerCategoryList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENConsumerCategory.Row:=CurrentRow-5;
   sgENConsumerCategory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENConsumerCategoryShow.sgENConsumerCategoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENConsumerCategory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENConsumerCategoryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENConsumerCategory.RowCount-1 do
   for j:=0 to sgENConsumerCategory.ColCount-1 do
     sgENConsumerCategory.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENConsumerCategoryShow.actViewExecute(Sender: TObject);
Var TempENConsumerCategory: ENConsumerCategoryControllerSoapPort;
begin
 TempENConsumerCategory := HTTPRIOENConsumerCategory as ENConsumerCategoryControllerSoapPort;
   try
     ENConsumerCategoryObj := TempENConsumerCategory.getObject(StrToInt(sgENConsumerCategory.Cells[0,sgENConsumerCategory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENConsumerCategoryEdit:=TfrmENConsumerCategoryEdit.Create(Application, dsView);
  try
    frmENConsumerCategoryEdit.ShowModal;
  finally
    frmENConsumerCategoryEdit.Free;
    frmENConsumerCategoryEdit:=nil;
  end;
end;

procedure TfrmENConsumerCategoryShow.actEditExecute(Sender: TObject);
Var TempENConsumerCategory: ENConsumerCategoryControllerSoapPort;
begin
 TempENConsumerCategory := HTTPRIOENConsumerCategory as ENConsumerCategoryControllerSoapPort;
   try
     ENConsumerCategoryObj := TempENConsumerCategory.getObject(StrToInt(sgENConsumerCategory.Cells[0,sgENConsumerCategory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENConsumerCategoryEdit:=TfrmENConsumerCategoryEdit.Create(Application, dsEdit);
  try
    if frmENConsumerCategoryEdit.ShowModal= mrOk then
      begin
        //TempENConsumerCategory.save(ENConsumerCategoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENConsumerCategoryEdit.Free;
    frmENConsumerCategoryEdit:=nil;
  end;
end;

procedure TfrmENConsumerCategoryShow.actDeleteExecute(Sender: TObject);
Var TempENConsumerCategory: ENConsumerCategoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENConsumerCategory := HTTPRIOENConsumerCategory as ENConsumerCategoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENConsumerCategory.Cells[0,sgENConsumerCategory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Категории потребителей) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENConsumerCategory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENConsumerCategoryShow.actInsertExecute(Sender: TObject);
Var TempENConsumerCategory: ENConsumerCategoryControllerSoapPort;
begin
  TempENConsumerCategory := HTTPRIOENConsumerCategory as ENConsumerCategoryControllerSoapPort;
  ENConsumerCategoryObj:=ENConsumerCategory.Create;



  try
    frmENConsumerCategoryEdit:=TfrmENConsumerCategoryEdit.Create(Application, dsInsert);
    try
      if frmENConsumerCategoryEdit.ShowModal = mrOk then
      begin
        if ENConsumerCategoryObj<>nil then
            //TempENConsumerCategory.add(ENConsumerCategoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENConsumerCategoryEdit.Free;
      frmENConsumerCategoryEdit:=nil;
    end;
  finally
    ENConsumerCategoryObj.Free;
  end;
end;

procedure TfrmENConsumerCategoryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENConsumerCategoryShow.actFilterExecute(Sender: TObject);
begin
{frmENConsumerCategoryFilterEdit:=TfrmENConsumerCategoryFilterEdit.Create(Application, dsInsert);
  try
    ENConsumerCategoryFilterObj := ENConsumerCategoryFilter.Create;
    SetNullIntProps(ENConsumerCategoryFilterObj);
    SetNullXSProps(ENConsumerCategoryFilterObj);

    if frmENConsumerCategoryFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENConsumerCategoryFilter.Create;
      FilterObject := ENConsumerCategoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENConsumerCategoryFilterEdit.Free;
    frmENConsumerCategoryFilterEdit:=nil;
  end;}
end;

procedure TfrmENConsumerCategoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.