
unit ShowENPowerReliabilityCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPowerReliabilityCategoryController, AdvObj ;


type
  TfrmENPowerReliabilityCategoryShow = class(TChildForm)  
  HTTPRIOENPowerReliabilityCategory: THTTPRIO;
    ImageList1: TImageList;
    sgENPowerReliabilityCategory: TAdvStringGrid;
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
procedure sgENPowerReliabilityCategoryTopLeftChanged(Sender: TObject);
procedure sgENPowerReliabilityCategoryDblClick(Sender: TObject);
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
 frmENPowerReliabilityCategoryShow : TfrmENPowerReliabilityCategoryShow;
 // ENPowerReliabilityCategoryObj: ENPowerReliabilityCategory;
 // ENPowerReliabilityCategoryFilterObj: ENPowerReliabilityCategoryFilter;
  
  
implementation

uses Main, EditENPowerReliabilityCategory, EditENPowerReliabilityCategoryFilter;


{$R *.dfm}

var
  //frmENPowerReliabilityCategoryShow : TfrmENPowerReliabilityCategoryShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPowerReliabilityCategoryHeaders: array [1..4] of String =
        ( 'Код'
          ,'Категорія надійності електропостачання'
          ,'Тип місцевості'
          ,'Коефіцієнт'
        );
   

procedure TfrmENPowerReliabilityCategoryShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPowerReliabilityCategoryShow:=nil;
    inherited;
  end;


procedure TfrmENPowerReliabilityCategoryShow.FormShow(Sender: TObject);
var
  TempENPowerReliabilityCategory: ENPowerReliabilityCategoryControllerSoapPort;
  i: Integer;
  ENPowerReliabilityCategoryList: ENPowerReliabilityCategoryShortList;
  begin
  SetGridHeaders(ENPowerReliabilityCategoryHeaders, sgENPowerReliabilityCategory.ColumnHeaders);
  ColCount:=100;
  TempENPowerReliabilityCategory :=  HTTPRIOENPowerReliabilityCategory as ENPowerReliabilityCategoryControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPowerReliabilityCategoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPowerReliabilityCategoryList := TempENPowerReliabilityCategory.getScrollableFilteredList(ENPowerReliabilityCategoryFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPowerReliabilityCategoryList.list);

  if LastCount > -1 then
     sgENPowerReliabilityCategory.RowCount:=LastCount+2
  else
     sgENPowerReliabilityCategory.RowCount:=2;

   with sgENPowerReliabilityCategory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPowerReliabilityCategoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPowerReliabilityCategoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPowerReliabilityCategoryList.list[i].name;
        Cells[2,i+1] := ENPowerReliabilityCategoryList.list[i].settleTypeRefName;
        Cells[3,i+1] := ENPowerReliabilityCategoryList.list[i].coef.DecimalString;

        LastRow:=i+1;
        sgENPowerReliabilityCategory.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPowerReliabilityCategory.Row:=1;
end;

procedure TfrmENPowerReliabilityCategoryShow.sgENPowerReliabilityCategoryTopLeftChanged(Sender: TObject);
var
  TempENPowerReliabilityCategory: ENPowerReliabilityCategoryControllerSoapPort;
  i,CurrentRow: Integer;
  ENPowerReliabilityCategoryList: ENPowerReliabilityCategoryShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPowerReliabilityCategory.TopRow + sgENPowerReliabilityCategory.VisibleRowCount) = ColCount
  then
    begin
      TempENPowerReliabilityCategory :=  HTTPRIOENPowerReliabilityCategory as ENPowerReliabilityCategoryControllerSoapPort;
      CurrentRow:=sgENPowerReliabilityCategory.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPowerReliabilityCategoryFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPowerReliabilityCategoryList := TempENPowerReliabilityCategory.getScrollableFilteredList(ENPowerReliabilityCategoryFilter(FilterObject),ColCount-1, 100);



  sgENPowerReliabilityCategory.RowCount:=sgENPowerReliabilityCategory.RowCount+100;
  LastCount:=High(ENPowerReliabilityCategoryList.list);
  with sgENPowerReliabilityCategory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPowerReliabilityCategoryList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPowerReliabilityCategoryList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPowerReliabilityCategoryList.list[i].name;
        Cells[2,i+CurrentRow] := ENPowerReliabilityCategoryList.list[i].settleTypeRefName;
        Cells[3,i+CurrentRow] := ENPowerReliabilityCategoryList.list[i].coef.DecimalString;
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPowerReliabilityCategory.Row:=CurrentRow-5;
   sgENPowerReliabilityCategory.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPowerReliabilityCategoryShow.sgENPowerReliabilityCategoryDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPowerReliabilityCategory,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPowerReliabilityCategoryShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPowerReliabilityCategory.RowCount-1 do
   for j:=0 to sgENPowerReliabilityCategory.ColCount-1 do
     sgENPowerReliabilityCategory.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPowerReliabilityCategoryShow.actViewExecute(Sender: TObject);
Var TempENPowerReliabilityCategory: ENPowerReliabilityCategoryControllerSoapPort;
begin
 TempENPowerReliabilityCategory := HTTPRIOENPowerReliabilityCategory as ENPowerReliabilityCategoryControllerSoapPort;
   try
     ENPowerReliabilityCategoryObj := TempENPowerReliabilityCategory.getObject(StrToInt(sgENPowerReliabilityCategory.Cells[0,sgENPowerReliabilityCategory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPowerReliabilityCategoryEdit:=TfrmENPowerReliabilityCategoryEdit.Create(Application, dsView);
  try
    frmENPowerReliabilityCategoryEdit.ShowModal;
  finally
    frmENPowerReliabilityCategoryEdit.Free;
    frmENPowerReliabilityCategoryEdit:=nil;
  end;
end;

procedure TfrmENPowerReliabilityCategoryShow.actEditExecute(Sender: TObject);
Var TempENPowerReliabilityCategory: ENPowerReliabilityCategoryControllerSoapPort;
begin
 TempENPowerReliabilityCategory := HTTPRIOENPowerReliabilityCategory as ENPowerReliabilityCategoryControllerSoapPort;
   try
     ENPowerReliabilityCategoryObj := TempENPowerReliabilityCategory.getObject(StrToInt(sgENPowerReliabilityCategory.Cells[0,sgENPowerReliabilityCategory.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPowerReliabilityCategoryEdit:=TfrmENPowerReliabilityCategoryEdit.Create(Application, dsEdit);
  try
    if frmENPowerReliabilityCategoryEdit.ShowModal= mrOk then
      begin
        //TempENPowerReliabilityCategory.save(ENPowerReliabilityCategoryObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPowerReliabilityCategoryEdit.Free;
    frmENPowerReliabilityCategoryEdit:=nil;
  end;
end;

procedure TfrmENPowerReliabilityCategoryShow.actDeleteExecute(Sender: TObject);
Var TempENPowerReliabilityCategory: ENPowerReliabilityCategoryControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPowerReliabilityCategory := HTTPRIOENPowerReliabilityCategory as ENPowerReliabilityCategoryControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPowerReliabilityCategory.Cells[0,sgENPowerReliabilityCategory.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Категорія надійності електропостачання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPowerReliabilityCategory.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPowerReliabilityCategoryShow.actInsertExecute(Sender: TObject);
// Var TempENPowerReliabilityCategory: ENPowerReliabilityCategoryControllerSoapPort; 
begin
  // TempENPowerReliabilityCategory := HTTPRIOENPowerReliabilityCategory as ENPowerReliabilityCategoryControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPowerReliabilityCategoryObj:=ENPowerReliabilityCategory.Create;



  try
    frmENPowerReliabilityCategoryEdit:=TfrmENPowerReliabilityCategoryEdit.Create(Application, dsInsert);
    try
      if frmENPowerReliabilityCategoryEdit.ShowModal = mrOk then
      begin
        if ENPowerReliabilityCategoryObj<>nil then
            //TempENPowerReliabilityCategory.add(ENPowerReliabilityCategoryObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPowerReliabilityCategoryEdit.Free;
      frmENPowerReliabilityCategoryEdit:=nil;
    end;
  finally
    ENPowerReliabilityCategoryObj.Free;
  end;
end;

procedure TfrmENPowerReliabilityCategoryShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPowerReliabilityCategoryShow.actFilterExecute(Sender: TObject);
begin
{frmENPowerReliabilityCategoryFilterEdit:=TfrmENPowerReliabilityCategoryFilterEdit.Create(Application, dsInsert);
  try
    ENPowerReliabilityCategoryFilterObj := ENPowerReliabilityCategoryFilter.Create;
    SetNullIntProps(ENPowerReliabilityCategoryFilterObj);
    SetNullXSProps(ENPowerReliabilityCategoryFilterObj);

    if frmENPowerReliabilityCategoryFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPowerReliabilityCategoryFilter.Create;
      FilterObject := ENPowerReliabilityCategoryFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPowerReliabilityCategoryFilterEdit.Free;
    frmENPowerReliabilityCategoryFilterEdit:=nil;
  end;}
end;

procedure TfrmENPowerReliabilityCategoryShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.