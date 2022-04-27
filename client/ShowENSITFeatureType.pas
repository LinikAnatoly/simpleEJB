
unit ShowENSITFeatureType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSITFeatureTypeController ;


type
  TfrmENSITFeatureTypeShow = class(TChildForm)  
  HTTPRIOENSITFeatureType: THTTPRIO;
    ImageList1: TImageList;
    sgENSITFeatureType: TAdvStringGrid;
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
procedure sgENSITFeatureTypeTopLeftChanged(Sender: TObject);
procedure sgENSITFeatureTypeDblClick(Sender: TObject);
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
 // ENSITFeatureTypeObj: ENSITFeatureType;
 // ENSITFeatureTypeFilterObj: ENSITFeatureTypeFilter;
  
  
implementation

uses Main, EditENSITFeatureType, EditENSITFeatureTypeFilter;


{$R *.dfm}

var
  //frmENSITFeatureTypeShow : TfrmENSITFeatureTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSITFeatureTypeHeaders: array [1..3] of String =
        ( 'Код'
          ,'Назва'
          ,'Опис'
        );
   

procedure TfrmENSITFeatureTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSITFeatureTypeShow:=nil;
    inherited;
  end;


procedure TfrmENSITFeatureTypeShow.FormShow(Sender: TObject);
var
  TempENSITFeatureType: ENSITFeatureTypeControllerSoapPort;
  i: Integer;
  ENSITFeatureTypeList: ENSITFeatureTypeShortList;
  begin
  SetGridHeaders(ENSITFeatureTypeHeaders, sgENSITFeatureType.ColumnHeaders);
  ColCount:=100;
  TempENSITFeatureType :=  HTTPRIOENSITFeatureType as ENSITFeatureTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSITFeatureTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSITFeatureTypeList := TempENSITFeatureType.getScrollableFilteredList(ENSITFeatureTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSITFeatureTypeList.list);

  if LastCount > -1 then
     sgENSITFeatureType.RowCount:=LastCount+2
  else
     sgENSITFeatureType.RowCount:=2;

   with sgENSITFeatureType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITFeatureTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSITFeatureTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSITFeatureTypeList.list[i].name;
        Cells[2,i+1] := ENSITFeatureTypeList.list[i].desc;
        LastRow:=i+1;
        sgENSITFeatureType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSITFeatureType.Row:=1;
end;

procedure TfrmENSITFeatureTypeShow.sgENSITFeatureTypeTopLeftChanged(Sender: TObject);
var
  TempENSITFeatureType: ENSITFeatureTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSITFeatureTypeList: ENSITFeatureTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSITFeatureType.TopRow + sgENSITFeatureType.VisibleRowCount) = ColCount
  then
    begin
      TempENSITFeatureType :=  HTTPRIOENSITFeatureType as ENSITFeatureTypeControllerSoapPort;
      CurrentRow:=sgENSITFeatureType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSITFeatureTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSITFeatureTypeList := TempENSITFeatureType.getScrollableFilteredList(ENSITFeatureTypeFilter(FilterObject),ColCount-1, 100);



  sgENSITFeatureType.RowCount:=sgENSITFeatureType.RowCount+100;
  LastCount:=High(ENSITFeatureTypeList.list);
  with sgENSITFeatureType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITFeatureTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSITFeatureTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSITFeatureTypeList.list[i].name;
        Cells[2,i+CurrentRow] := ENSITFeatureTypeList.list[i].desc;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSITFeatureType.Row:=CurrentRow-5;
   sgENSITFeatureType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSITFeatureTypeShow.sgENSITFeatureTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSITFeatureType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSITFeatureTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSITFeatureType.RowCount-1 do
   for j:=0 to sgENSITFeatureType.ColCount-1 do
     sgENSITFeatureType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSITFeatureTypeShow.actViewExecute(Sender: TObject);
Var TempENSITFeatureType: ENSITFeatureTypeControllerSoapPort;
begin
 TempENSITFeatureType := HTTPRIOENSITFeatureType as ENSITFeatureTypeControllerSoapPort;
   try
     ENSITFeatureTypeObj := TempENSITFeatureType.getObject(StrToInt(sgENSITFeatureType.Cells[0,sgENSITFeatureType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITFeatureTypeEdit:=TfrmENSITFeatureTypeEdit.Create(Application, dsView);
  try
    frmENSITFeatureTypeEdit.ShowModal;
  finally
    frmENSITFeatureTypeEdit.Free;
    frmENSITFeatureTypeEdit:=nil;
  end;
end;

procedure TfrmENSITFeatureTypeShow.actEditExecute(Sender: TObject);
Var TempENSITFeatureType: ENSITFeatureTypeControllerSoapPort;
begin
 TempENSITFeatureType := HTTPRIOENSITFeatureType as ENSITFeatureTypeControllerSoapPort;
   try
     ENSITFeatureTypeObj := TempENSITFeatureType.getObject(StrToInt(sgENSITFeatureType.Cells[0,sgENSITFeatureType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITFeatureTypeEdit:=TfrmENSITFeatureTypeEdit.Create(Application, dsEdit);
  try
    if frmENSITFeatureTypeEdit.ShowModal= mrOk then
      begin
        //TempENSITFeatureType.save(ENSITFeatureTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSITFeatureTypeEdit.Free;
    frmENSITFeatureTypeEdit:=nil;
  end;
end;

procedure TfrmENSITFeatureTypeShow.actDeleteExecute(Sender: TObject);
Var TempENSITFeatureType: ENSITFeatureTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSITFeatureType := HTTPRIOENSITFeatureType as ENSITFeatureTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSITFeatureType.Cells[0,sgENSITFeatureType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи свойств) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSITFeatureType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSITFeatureTypeShow.actInsertExecute(Sender: TObject);
Var TempENSITFeatureType: ENSITFeatureTypeControllerSoapPort;
begin
  TempENSITFeatureType := HTTPRIOENSITFeatureType as ENSITFeatureTypeControllerSoapPort;
  ENSITFeatureTypeObj:=ENSITFeatureType.Create;



  try
    frmENSITFeatureTypeEdit:=TfrmENSITFeatureTypeEdit.Create(Application, dsInsert);
    try
      if frmENSITFeatureTypeEdit.ShowModal = mrOk then
      begin
        if ENSITFeatureTypeObj<>nil then
            //TempENSITFeatureType.add(ENSITFeatureTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSITFeatureTypeEdit.Free;
      frmENSITFeatureTypeEdit:=nil;
    end;
  finally
    ENSITFeatureTypeObj.Free;
  end;
end;

procedure TfrmENSITFeatureTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSITFeatureTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENSITFeatureTypeFilterEdit:=TfrmENSITFeatureTypeFilterEdit.Create(Application, dsEdit);
  try
    ENSITFeatureTypeFilterObj := ENSITFeatureTypeFilter.Create;
    SetNullIntProps(ENSITFeatureTypeFilterObj);
    SetNullXSProps(ENSITFeatureTypeFilterObj);

    if frmENSITFeatureTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSITFeatureTypeFilter.Create;
      FilterObject := ENSITFeatureTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSITFeatureTypeFilterEdit.Free;
    frmENSITFeatureTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENSITFeatureTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.