
unit ShowENTiresInstallPlaces;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTiresInstallPlacesController ;


type
  TfrmENTiresInstallPlacesShow = class(TChildForm)  
  HTTPRIOENTiresInstallPlaces: THTTPRIO;
    ImageList1: TImageList;
    sgENTiresInstallPlaces: TAdvStringGrid;
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
procedure sgENTiresInstallPlacesTopLeftChanged(Sender: TObject);
procedure sgENTiresInstallPlacesDblClick(Sender: TObject);
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
 // ENTiresInstallPlacesObj: ENTiresInstallPlaces;
 // ENTiresInstallPlacesFilterObj: ENTiresInstallPlacesFilter;
  
  
implementation

uses Main, EditENTiresInstallPlaces, EditENTiresInstallPlacesFilter;


{$R *.dfm}

var
  //frmENTiresInstallPlacesShow : TfrmENTiresInstallPlacesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTiresInstallPlacesHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва'
        );
   

procedure TfrmENTiresInstallPlacesShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTiresInstallPlacesShow:=nil;
    inherited;
  end;


procedure TfrmENTiresInstallPlacesShow.FormShow(Sender: TObject);
var
  TempENTiresInstallPlaces: ENTiresInstallPlacesControllerSoapPort;
  i: Integer;
  ENTiresInstallPlacesList: ENTiresInstallPlacesShortList;
  begin
  SetGridHeaders(ENTiresInstallPlacesHeaders, sgENTiresInstallPlaces.ColumnHeaders);
  ColCount:=100;
  TempENTiresInstallPlaces :=  HTTPRIOENTiresInstallPlaces as ENTiresInstallPlacesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTiresInstallPlacesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTiresInstallPlacesList := TempENTiresInstallPlaces.getScrollableFilteredList(ENTiresInstallPlacesFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTiresInstallPlacesList.list);

  if LastCount > -1 then
     sgENTiresInstallPlaces.RowCount:=LastCount+2
  else
     sgENTiresInstallPlaces.RowCount:=2;

   with sgENTiresInstallPlaces do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTiresInstallPlacesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTiresInstallPlacesList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTiresInstallPlacesList.list[i].name;
        LastRow:=i+1;
        sgENTiresInstallPlaces.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTiresInstallPlaces.Row:=1;
end;

procedure TfrmENTiresInstallPlacesShow.sgENTiresInstallPlacesTopLeftChanged(Sender: TObject);
var
  TempENTiresInstallPlaces: ENTiresInstallPlacesControllerSoapPort;
  i,CurrentRow: Integer;
  ENTiresInstallPlacesList: ENTiresInstallPlacesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTiresInstallPlaces.TopRow + sgENTiresInstallPlaces.VisibleRowCount) = ColCount
  then
    begin
      TempENTiresInstallPlaces :=  HTTPRIOENTiresInstallPlaces as ENTiresInstallPlacesControllerSoapPort;
      CurrentRow:=sgENTiresInstallPlaces.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTiresInstallPlacesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTiresInstallPlacesList := TempENTiresInstallPlaces.getScrollableFilteredList(ENTiresInstallPlacesFilter(FilterObject),ColCount-1, 100);



  sgENTiresInstallPlaces.RowCount:=sgENTiresInstallPlaces.RowCount+100;
  LastCount:=High(ENTiresInstallPlacesList.list);
  with sgENTiresInstallPlaces do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTiresInstallPlacesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTiresInstallPlacesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTiresInstallPlacesList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTiresInstallPlaces.Row:=CurrentRow-5;
   sgENTiresInstallPlaces.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTiresInstallPlacesShow.sgENTiresInstallPlacesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTiresInstallPlaces,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTiresInstallPlacesShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTiresInstallPlaces.RowCount-1 do
   for j:=0 to sgENTiresInstallPlaces.ColCount-1 do
     sgENTiresInstallPlaces.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTiresInstallPlacesShow.actViewExecute(Sender: TObject);
Var TempENTiresInstallPlaces: ENTiresInstallPlacesControllerSoapPort;
begin
 TempENTiresInstallPlaces := HTTPRIOENTiresInstallPlaces as ENTiresInstallPlacesControllerSoapPort;
   try
     ENTiresInstallPlacesObj := TempENTiresInstallPlaces.getObject(StrToInt(sgENTiresInstallPlaces.Cells[0,sgENTiresInstallPlaces.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTiresInstallPlacesEdit:=TfrmENTiresInstallPlacesEdit.Create(Application, dsView);
  try
    frmENTiresInstallPlacesEdit.ShowModal;
  finally
    frmENTiresInstallPlacesEdit.Free;
    frmENTiresInstallPlacesEdit:=nil;
  end;
end;

procedure TfrmENTiresInstallPlacesShow.actEditExecute(Sender: TObject);
Var TempENTiresInstallPlaces: ENTiresInstallPlacesControllerSoapPort;
begin
 TempENTiresInstallPlaces := HTTPRIOENTiresInstallPlaces as ENTiresInstallPlacesControllerSoapPort;
   try
     ENTiresInstallPlacesObj := TempENTiresInstallPlaces.getObject(StrToInt(sgENTiresInstallPlaces.Cells[0,sgENTiresInstallPlaces.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTiresInstallPlacesEdit:=TfrmENTiresInstallPlacesEdit.Create(Application, dsEdit);
  try
    if frmENTiresInstallPlacesEdit.ShowModal= mrOk then
      begin
        //TempENTiresInstallPlaces.save(ENTiresInstallPlacesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTiresInstallPlacesEdit.Free;
    frmENTiresInstallPlacesEdit:=nil;
  end;
end;

procedure TfrmENTiresInstallPlacesShow.actDeleteExecute(Sender: TObject);
Var TempENTiresInstallPlaces: ENTiresInstallPlacesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTiresInstallPlaces := HTTPRIOENTiresInstallPlaces as ENTiresInstallPlacesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTiresInstallPlaces.Cells[0,sgENTiresInstallPlaces.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Место установки автопокрышки на колесо) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTiresInstallPlaces.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTiresInstallPlacesShow.actInsertExecute(Sender: TObject);
Var TempENTiresInstallPlaces: ENTiresInstallPlacesControllerSoapPort;
begin
  TempENTiresInstallPlaces := HTTPRIOENTiresInstallPlaces as ENTiresInstallPlacesControllerSoapPort;
  ENTiresInstallPlacesObj:=ENTiresInstallPlaces.Create;



  try
    frmENTiresInstallPlacesEdit:=TfrmENTiresInstallPlacesEdit.Create(Application, dsInsert);
    try
      if frmENTiresInstallPlacesEdit.ShowModal = mrOk then
      begin
        if ENTiresInstallPlacesObj<>nil then
            //TempENTiresInstallPlaces.add(ENTiresInstallPlacesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTiresInstallPlacesEdit.Free;
      frmENTiresInstallPlacesEdit:=nil;
    end;
  finally
    ENTiresInstallPlacesObj.Free;
  end;
end;

procedure TfrmENTiresInstallPlacesShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTiresInstallPlacesShow.actFilterExecute(Sender: TObject);
begin
{frmENTiresInstallPlacesFilterEdit:=TfrmENTiresInstallPlacesFilterEdit.Create(Application, dsInsert);
  try
    ENTiresInstallPlacesFilterObj := ENTiresInstallPlacesFilter.Create;
    SetNullIntProps(ENTiresInstallPlacesFilterObj);
    SetNullXSProps(ENTiresInstallPlacesFilterObj);

    if frmENTiresInstallPlacesFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTiresInstallPlacesFilter.Create;
      FilterObject := ENTiresInstallPlacesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTiresInstallPlacesFilterEdit.Free;
    frmENTiresInstallPlacesFilterEdit:=nil;
  end;}
end;

procedure TfrmENTiresInstallPlacesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.