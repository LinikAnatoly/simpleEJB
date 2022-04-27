
unit ShowENSizMaterials2TKMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSizMaterials2TKMaterialsController ;


type
  TfrmENSizMaterials2TKMaterialsShow = class(TChildForm)  
  HTTPRIOENSizMaterials2TKMaterials: THTTPRIO;
    ImageList1: TImageList;
    sgENSizMaterials2TKMaterials: TAdvStringGrid;
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
procedure sgENSizMaterials2TKMaterialsTopLeftChanged(Sender: TObject);
procedure sgENSizMaterials2TKMaterialsDblClick(Sender: TObject);
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
 // ENSizMaterials2TKMaterialsObj: ENSizMaterials2TKMaterials;
 // ENSizMaterials2TKMaterialsFilterObj: ENSizMaterials2TKMaterialsFilter;
  
  
implementation

uses Main, EditENSizMaterials2TKMaterials, EditENSizMaterials2TKMaterialsFilter;


{$R *.dfm}

var
  //frmENSizMaterials2TKMaterialsShow : TfrmENSizMaterials2TKMaterialsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSizMaterials2TKMaterialsHeaders: array [1..2] of String =
        ( 'Код'
        ,'назва'
        );
   

procedure TfrmENSizMaterials2TKMaterialsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSizMaterials2TKMaterialsShow:=nil;
    inherited;
  end;


procedure TfrmENSizMaterials2TKMaterialsShow.FormShow(Sender: TObject);
var
  TempENSizMaterials2TKMaterials: ENSizMaterials2TKMaterialsControllerSoapPort;
  i: Integer;
  ENSizMaterials2TKMaterialsList: ENSizMaterials2TKMaterialsShortList;
  begin
  SetGridHeaders(ENSizMaterials2TKMaterialsHeaders, sgENSizMaterials2TKMaterials.ColumnHeaders);
  ColCount:=100;
  TempENSizMaterials2TKMaterials :=  HTTPRIOENSizMaterials2TKMaterials as ENSizMaterials2TKMaterialsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSizMaterials2TKMaterialsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSizMaterials2TKMaterialsList := TempENSizMaterials2TKMaterials.getScrollableFilteredList(ENSizMaterials2TKMaterialsFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSizMaterials2TKMaterialsList.list);

  if LastCount > -1 then
     sgENSizMaterials2TKMaterials.RowCount:=LastCount+2
  else
     sgENSizMaterials2TKMaterials.RowCount:=2;

   with sgENSizMaterials2TKMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSizMaterials2TKMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSizMaterials2TKMaterialsList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENSizMaterials2TKMaterials.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSizMaterials2TKMaterials.Row:=1;
end;

procedure TfrmENSizMaterials2TKMaterialsShow.sgENSizMaterials2TKMaterialsTopLeftChanged(Sender: TObject);
var
  TempENSizMaterials2TKMaterials: ENSizMaterials2TKMaterialsControllerSoapPort;
  i,CurrentRow: Integer;
  ENSizMaterials2TKMaterialsList: ENSizMaterials2TKMaterialsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSizMaterials2TKMaterials.TopRow + sgENSizMaterials2TKMaterials.VisibleRowCount) = ColCount
  then
    begin
      TempENSizMaterials2TKMaterials :=  HTTPRIOENSizMaterials2TKMaterials as ENSizMaterials2TKMaterialsControllerSoapPort;
      CurrentRow:=sgENSizMaterials2TKMaterials.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSizMaterials2TKMaterialsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSizMaterials2TKMaterialsList := TempENSizMaterials2TKMaterials.getScrollableFilteredList(ENSizMaterials2TKMaterialsFilter(FilterObject),ColCount-1, 100);



  sgENSizMaterials2TKMaterials.RowCount:=sgENSizMaterials2TKMaterials.RowCount+100;
  LastCount:=High(ENSizMaterials2TKMaterialsList.list);
  with sgENSizMaterials2TKMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSizMaterials2TKMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSizMaterials2TKMaterialsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSizMaterials2TKMaterials.Row:=CurrentRow-5;
   sgENSizMaterials2TKMaterials.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSizMaterials2TKMaterialsShow.sgENSizMaterials2TKMaterialsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSizMaterials2TKMaterials,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSizMaterials2TKMaterialsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSizMaterials2TKMaterials.RowCount-1 do
   for j:=0 to sgENSizMaterials2TKMaterials.ColCount-1 do
     sgENSizMaterials2TKMaterials.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSizMaterials2TKMaterialsShow.actViewExecute(Sender: TObject);
Var TempENSizMaterials2TKMaterials: ENSizMaterials2TKMaterialsControllerSoapPort;
begin
 TempENSizMaterials2TKMaterials := HTTPRIOENSizMaterials2TKMaterials as ENSizMaterials2TKMaterialsControllerSoapPort;
   try
     ENSizMaterials2TKMaterialsObj := TempENSizMaterials2TKMaterials.getObject(StrToInt(sgENSizMaterials2TKMaterials.Cells[0,sgENSizMaterials2TKMaterials.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSizMaterials2TKMaterialsEdit:=TfrmENSizMaterials2TKMaterialsEdit.Create(Application, dsView);
  try
    frmENSizMaterials2TKMaterialsEdit.ShowModal;
  finally
    frmENSizMaterials2TKMaterialsEdit.Free;
    frmENSizMaterials2TKMaterialsEdit:=nil;
  end;
end;

procedure TfrmENSizMaterials2TKMaterialsShow.actEditExecute(Sender: TObject);
Var TempENSizMaterials2TKMaterials: ENSizMaterials2TKMaterialsControllerSoapPort;
begin
 TempENSizMaterials2TKMaterials := HTTPRIOENSizMaterials2TKMaterials as ENSizMaterials2TKMaterialsControllerSoapPort;
   try
     ENSizMaterials2TKMaterialsObj := TempENSizMaterials2TKMaterials.getObject(StrToInt(sgENSizMaterials2TKMaterials.Cells[0,sgENSizMaterials2TKMaterials.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSizMaterials2TKMaterialsEdit:=TfrmENSizMaterials2TKMaterialsEdit.Create(Application, dsEdit);
  try
    if frmENSizMaterials2TKMaterialsEdit.ShowModal= mrOk then
      begin
        //TempENSizMaterials2TKMaterials.save(ENSizMaterials2TKMaterialsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSizMaterials2TKMaterialsEdit.Free;
    frmENSizMaterials2TKMaterialsEdit:=nil;
  end;
end;

procedure TfrmENSizMaterials2TKMaterialsShow.actDeleteExecute(Sender: TObject);
Var TempENSizMaterials2TKMaterials: ENSizMaterials2TKMaterialsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSizMaterials2TKMaterials := HTTPRIOENSizMaterials2TKMaterials as ENSizMaterials2TKMaterialsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSizMaterials2TKMaterials.Cells[0,sgENSizMaterials2TKMaterials.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связь СИЗ-материала с реальным матириалом) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSizMaterials2TKMaterials.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSizMaterials2TKMaterialsShow.actInsertExecute(Sender: TObject);
Var TempENSizMaterials2TKMaterials: ENSizMaterials2TKMaterialsControllerSoapPort;
begin
  TempENSizMaterials2TKMaterials := HTTPRIOENSizMaterials2TKMaterials as ENSizMaterials2TKMaterialsControllerSoapPort;
  ENSizMaterials2TKMaterialsObj:=ENSizMaterials2TKMaterials.Create;



  try
    frmENSizMaterials2TKMaterialsEdit:=TfrmENSizMaterials2TKMaterialsEdit.Create(Application, dsInsert);
    try
      if frmENSizMaterials2TKMaterialsEdit.ShowModal = mrOk then
      begin
        if ENSizMaterials2TKMaterialsObj<>nil then
            //TempENSizMaterials2TKMaterials.add(ENSizMaterials2TKMaterialsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSizMaterials2TKMaterialsEdit.Free;
      frmENSizMaterials2TKMaterialsEdit:=nil;
    end;
  finally
    ENSizMaterials2TKMaterialsObj.Free;
  end;
end;

procedure TfrmENSizMaterials2TKMaterialsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSizMaterials2TKMaterialsShow.actFilterExecute(Sender: TObject);
begin
{frmENSizMaterials2TKMaterialsFilterEdit:=TfrmENSizMaterials2TKMaterialsFilterEdit.Create(Application, dsInsert);
  try
    ENSizMaterials2TKMaterialsFilterObj := ENSizMaterials2TKMaterialsFilter.Create;
    SetNullIntProps(ENSizMaterials2TKMaterialsFilterObj);
    SetNullXSProps(ENSizMaterials2TKMaterialsFilterObj);

    if frmENSizMaterials2TKMaterialsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSizMaterials2TKMaterialsFilter.Create;
      FilterObject := ENSizMaterials2TKMaterialsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSizMaterials2TKMaterialsFilterEdit.Free;
    frmENSizMaterials2TKMaterialsFilterEdit:=nil;
  end;}
end;

procedure TfrmENSizMaterials2TKMaterialsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.