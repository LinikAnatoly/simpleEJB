unit ShowENArresterSite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENArresterSiteController, AdvObj ;


type
  TfrmENArresterSiteShow = class(TChildForm)  
  HTTPRIOENArresterSite: THTTPRIO;
    ImageList1: TImageList;
    sgENArresterSite: TAdvStringGrid;
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
procedure sgENArresterSiteTopLeftChanged(Sender: TObject);
procedure sgENArresterSiteDblClick(Sender: TObject);
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
 frmENArresterSiteShow : TfrmENArresterSiteShow;
 // ENArresterSiteObj: ENArresterSite;
 // ENArresterSiteFilterObj: ENArresterSiteFilter;
  
  
implementation

uses Main, EditENArresterSite, EditENArresterSiteFilter;


{$R *.dfm}

var
  //frmENArresterSiteShow : TfrmENArresterSiteShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENArresterSiteHeaders: array [1..2] of String =
        ( 'Код'
          ,'Место установки'
        );
   

procedure TfrmENArresterSiteShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENArresterSiteShow:=nil;
    inherited;
  end;


procedure TfrmENArresterSiteShow.FormShow(Sender: TObject);
var
  TempENArresterSite: ENArresterSiteControllerSoapPort;
  i: Integer;
  ENArresterSiteList: ENArresterSiteShortList;
begin
  SetGridHeaders(ENArresterSiteHeaders, sgENArresterSite.ColumnHeaders);
  ColCount:=100;
  TempENArresterSite :=
    HTTPRIOENArresterSite as ENArresterSiteControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENArresterSiteFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENArresterSiteList :=
    TempENArresterSite.getScrollableFilteredList(
      ENArresterSiteFilter(FilterObject), 0, ColCount);

  LastCount:=High(ENArresterSiteList.list);

  if LastCount > -1 then
     sgENArresterSite.RowCount := LastCount+2
  else
     sgENArresterSite.RowCount := 2;

   with sgENArresterSite do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENArresterSiteList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENArresterSiteList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENArresterSiteList.list[i].name;
        LastRow:=i+1;
        sgENArresterSite.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENArresterSite.Row:=1;
end;

procedure TfrmENArresterSiteShow.sgENArresterSiteTopLeftChanged(Sender: TObject);
var
  TempENArresterSite: ENArresterSiteControllerSoapPort;
  i,CurrentRow: Integer;
  ENArresterSiteList: ENArresterSiteShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENArresterSite.TopRow + sgENArresterSite.VisibleRowCount) = ColCount
  then
    begin
      TempENArresterSite :=  HTTPRIOENArresterSite as ENArresterSiteControllerSoapPort;
      CurrentRow:=sgENArresterSite.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENArresterSiteFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENArresterSiteList := TempENArresterSite.getScrollableFilteredList(ENArresterSiteFilter(FilterObject),ColCount-1, 100);



  sgENArresterSite.RowCount:=sgENArresterSite.RowCount+100;
  LastCount:=High(ENArresterSiteList.list);
  with sgENArresterSite do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENArresterSiteList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENArresterSiteList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENArresterSiteList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENArresterSite.Row:=CurrentRow-5;
   sgENArresterSite.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENArresterSiteShow.sgENArresterSiteDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENArresterSite,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENArresterSiteShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENArresterSite.RowCount-1 do
   for j:=0 to sgENArresterSite.ColCount-1 do
     sgENArresterSite.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENArresterSiteShow.actViewExecute(Sender: TObject);
Var TempENArresterSite: ENArresterSiteControllerSoapPort;
begin
 TempENArresterSite := HTTPRIOENArresterSite as ENArresterSiteControllerSoapPort;
   try
     ENArresterSiteObj := TempENArresterSite.getObject(StrToInt(sgENArresterSite.Cells[0,sgENArresterSite.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENArresterSiteEdit:=TfrmENArresterSiteEdit.Create(Application, dsView);
  try
    frmENArresterSiteEdit.ShowModal;
  finally
    frmENArresterSiteEdit.Free;
    frmENArresterSiteEdit:=nil;
  end;
end;

procedure TfrmENArresterSiteShow.actEditExecute(Sender: TObject);
Var TempENArresterSite: ENArresterSiteControllerSoapPort;
begin
 TempENArresterSite := HTTPRIOENArresterSite as ENArresterSiteControllerSoapPort;
   try
     ENArresterSiteObj := TempENArresterSite.getObject(StrToInt(sgENArresterSite.Cells[0,sgENArresterSite.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENArresterSiteEdit:=TfrmENArresterSiteEdit.Create(Application, dsEdit);
  try
    if frmENArresterSiteEdit.ShowModal= mrOk then
      begin
        //TempENArresterSite.save(ENArresterSiteObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENArresterSiteEdit.Free;
    frmENArresterSiteEdit:=nil;
  end;
end;

procedure TfrmENArresterSiteShow.actDeleteExecute(Sender: TObject);
Var TempENArresterSite: ENArresterSiteControllerSoapPort;
  ObjCode: Integer;
begin
 TempENArresterSite := HTTPRIOENArresterSite as ENArresterSiteControllerSoapPort;
   try
     ObjCode := StrToInt(sgENArresterSite.Cells[0,sgENArresterSite.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Справочник мест установки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENArresterSite.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENArresterSiteShow.actInsertExecute(Sender: TObject);
Var TempENArresterSite: ENArresterSiteControllerSoapPort;
begin
  TempENArresterSite := HTTPRIOENArresterSite as ENArresterSiteControllerSoapPort;
  ENArresterSiteObj:=ENArresterSite.Create;



  try
    frmENArresterSiteEdit:=TfrmENArresterSiteEdit.Create(Application, dsInsert);
    try
      if frmENArresterSiteEdit.ShowModal = mrOk then
      begin
        if ENArresterSiteObj<>nil then
            //TempENArresterSite.add(ENArresterSiteObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENArresterSiteEdit.Free;
      frmENArresterSiteEdit:=nil;
    end;
  finally
    ENArresterSiteObj.Free;
  end;
end;

procedure TfrmENArresterSiteShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENArresterSiteShow.actFilterExecute(Sender: TObject);
begin
{frmENArresterSiteFilterEdit:=TfrmENArresterSiteFilterEdit.Create(Application, dsInsert);
  try
    ENArresterSiteFilterObj := ENArresterSiteFilter.Create;
    SetNullIntProps(ENArresterSiteFilterObj);
    SetNullXSProps(ENArresterSiteFilterObj);

    if frmENArresterSiteFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENArresterSiteFilter.Create;
      FilterObject := ENArresterSiteFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENArresterSiteFilterEdit.Free;
    frmENArresterSiteFilterEdit:=nil;
  end;}
end;

procedure TfrmENArresterSiteShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.