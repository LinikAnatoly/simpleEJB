
unit ShowENSite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSiteController, AdvObj ;


type
  TfrmENSiteShow = class(TChildForm)  
  HTTPRIOENSite: THTTPRIO;
    ImageList1: TImageList;
    sgENSite: TAdvStringGrid;
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
procedure sgENSiteTopLeftChanged(Sender: TObject);
procedure sgENSiteDblClick(Sender: TObject);
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
 frmENSiteShow : TfrmENSiteShow;
 // ENSiteObj: ENSite;
 // ENSiteFilterObj: ENSiteFilter;
  
  
implementation

uses Main, EditENSite, EditENSiteFilter;


{$R *.dfm}

var
  //frmENSiteShow : TfrmENSiteShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSiteHeaders: array [1..4] of String =
        ( 'Код'
          ,'Назва'
          ,'Адреса'
          ,'№ телефону'
        );
   

procedure TfrmENSiteShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSiteShow:=nil;
    inherited;
  end;


procedure TfrmENSiteShow.FormShow(Sender: TObject);
var
  TempENSite: ENSiteControllerSoapPort;
  i: Integer;
  ENSiteList: ENSiteShortList;
  begin
  SetGridHeaders(ENSiteHeaders, sgENSite.ColumnHeaders);
  ColCount:=100;
  TempENSite :=  HTTPRIOENSite as ENSiteControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSiteFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSiteList := TempENSite.getScrollableFilteredList(ENSiteFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSiteList.list);

  if LastCount > -1 then
     sgENSite.RowCount:=LastCount+2
  else
     sgENSite.RowCount:=2;

   with sgENSite do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSiteList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSiteList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSiteList.list[i].name;
        Cells[2,i+1] := ENSiteList.list[i].siteaddress;
        Cells[3,i+1] := ENSiteList.list[i].sitephone;
        LastRow:=i+1;
        sgENSite.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSite.Row:=1;
end;

procedure TfrmENSiteShow.sgENSiteTopLeftChanged(Sender: TObject);
var
  TempENSite: ENSiteControllerSoapPort;
  i,CurrentRow: Integer;
  ENSiteList: ENSiteShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSite.TopRow + sgENSite.VisibleRowCount) = ColCount
  then
    begin
      TempENSite :=  HTTPRIOENSite as ENSiteControllerSoapPort;
      CurrentRow:=sgENSite.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSiteFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSiteList := TempENSite.getScrollableFilteredList(ENSiteFilter(FilterObject),ColCount-1, 100);



  sgENSite.RowCount:=sgENSite.RowCount+100;
  LastCount:=High(ENSiteList.list);
  with sgENSite do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSiteList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSiteList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSiteList.list[i].name;
        Cells[2,i+CurrentRow] := ENSiteList.list[i].siteaddress;
        Cells[3,i+CurrentRow] := ENSiteList.list[i].sitephone;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSite.Row:=CurrentRow-5;
   sgENSite.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSiteShow.sgENSiteDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSite,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSiteShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSite.RowCount-1 do
   for j:=0 to sgENSite.ColCount-1 do
     sgENSite.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSiteShow.actViewExecute(Sender: TObject);
Var TempENSite: ENSiteControllerSoapPort;
begin
 TempENSite := HTTPRIOENSite as ENSiteControllerSoapPort;
   try
     ENSiteObj := TempENSite.getObject(StrToInt(sgENSite.Cells[0,sgENSite.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSiteEdit:=TfrmENSiteEdit.Create(Application, dsView);
  try
    frmENSiteEdit.ShowModal;
  finally
    frmENSiteEdit.Free;
    frmENSiteEdit:=nil;
  end;
end;

procedure TfrmENSiteShow.actEditExecute(Sender: TObject);
Var TempENSite: ENSiteControllerSoapPort;
begin
 TempENSite := HTTPRIOENSite as ENSiteControllerSoapPort;
   try
     ENSiteObj := TempENSite.getObject(StrToInt(sgENSite.Cells[0,sgENSite.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSiteEdit:=TfrmENSiteEdit.Create(Application, dsEdit);
  try
    if frmENSiteEdit.ShowModal= mrOk then
      begin
        //TempENSite.save(ENSiteObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSiteEdit.Free;
    frmENSiteEdit:=nil;
  end;
end;

procedure TfrmENSiteShow.actDeleteExecute(Sender: TObject);
Var TempENSite: ENSiteControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSite := HTTPRIOENSite as ENSiteControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSite.Cells[0,sgENSite.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Энергосбытовой участок) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSite.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSiteShow.actInsertExecute(Sender: TObject);
// Var TempENSite: ENSiteControllerSoapPort; 
begin
  // TempENSite := HTTPRIOENSite as ENSiteControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSiteObj:=ENSite.Create;



  try
    frmENSiteEdit:=TfrmENSiteEdit.Create(Application, dsInsert);
    try
      if frmENSiteEdit.ShowModal = mrOk then
      begin
        if ENSiteObj<>nil then
            //TempENSite.add(ENSiteObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSiteEdit.Free;
      frmENSiteEdit:=nil;
    end;
  finally
    ENSiteObj.Free;
  end;
end;

procedure TfrmENSiteShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSiteShow.actFilterExecute(Sender: TObject);
begin
{frmENSiteFilterEdit:=TfrmENSiteFilterEdit.Create(Application, dsInsert);
  try
    ENSiteFilterObj := ENSiteFilter.Create;
    SetNullIntProps(ENSiteFilterObj);
    SetNullXSProps(ENSiteFilterObj);

    if frmENSiteFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSiteFilter.Create;
      FilterObject := ENSiteFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSiteFilterEdit.Free;
    frmENSiteFilterEdit:=nil;
  end;}
end;

procedure TfrmENSiteShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.