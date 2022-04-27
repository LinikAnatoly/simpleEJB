
unit ShowENMolType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMolTypeController, AdvObj ;


type
  TfrmENMolTypeShow = class(TChildForm)  
  HTTPRIOENMolType: THTTPRIO;
    ImageList1: TImageList;
    sgENMolType: TAdvStringGrid;
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
procedure sgENMolTypeTopLeftChanged(Sender: TObject);
procedure sgENMolTypeDblClick(Sender: TObject);
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
 frmENMolTypeShow : TfrmENMolTypeShow;
 // ENMolTypeObj: ENMolType;
 // ENMolTypeFilterObj: ENMolTypeFilter;
  
  
implementation

uses Main, EditENMolType, EditENMolTypeFilter;


{$R *.dfm}

var
  //frmENMolTypeShow : TfrmENMolTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMolTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип МВО'
        );
   

procedure TfrmENMolTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMolTypeShow:=nil;
    inherited;
  end;


procedure TfrmENMolTypeShow.FormShow(Sender: TObject);
var
  TempENMolType: ENMolTypeControllerSoapPort;
  i: Integer;
  ENMolTypeList: ENMolTypeShortList;
  begin
  SetGridHeaders(ENMolTypeHeaders, sgENMolType.ColumnHeaders);
  ColCount:=100;
  TempENMolType :=  HTTPRIOENMolType as ENMolTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMolTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMolTypeList := TempENMolType.getScrollableFilteredList(ENMolTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMolTypeList.list);

  if LastCount > -1 then
     sgENMolType.RowCount:=LastCount+2
  else
     sgENMolType.RowCount:=2;

   with sgENMolType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMolTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMolTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMolTypeList.list[i].name;
        LastRow:=i+1;
        sgENMolType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMolType.Row:=1;
end;

procedure TfrmENMolTypeShow.sgENMolTypeTopLeftChanged(Sender: TObject);
var
  TempENMolType: ENMolTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENMolTypeList: ENMolTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMolType.TopRow + sgENMolType.VisibleRowCount) = ColCount
  then
    begin
      TempENMolType :=  HTTPRIOENMolType as ENMolTypeControllerSoapPort;
      CurrentRow:=sgENMolType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMolTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMolTypeList := TempENMolType.getScrollableFilteredList(ENMolTypeFilter(FilterObject),ColCount-1, 100);



  sgENMolType.RowCount:=sgENMolType.RowCount+100;
  LastCount:=High(ENMolTypeList.list);
  with sgENMolType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMolTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMolTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMolTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMolType.Row:=CurrentRow-5;
   sgENMolType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMolTypeShow.sgENMolTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMolType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMolTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMolType.RowCount-1 do
   for j:=0 to sgENMolType.ColCount-1 do
     sgENMolType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMolTypeShow.actViewExecute(Sender: TObject);
Var TempENMolType: ENMolTypeControllerSoapPort;
begin
 TempENMolType := HTTPRIOENMolType as ENMolTypeControllerSoapPort;
   try
     ENMolTypeObj := TempENMolType.getObject(StrToInt(sgENMolType.Cells[0,sgENMolType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMolTypeEdit:=TfrmENMolTypeEdit.Create(Application, dsView);
  try
    frmENMolTypeEdit.ShowModal;
  finally
    frmENMolTypeEdit.Free;
    frmENMolTypeEdit:=nil;
  end;
end;

procedure TfrmENMolTypeShow.actEditExecute(Sender: TObject);
Var TempENMolType: ENMolTypeControllerSoapPort;
begin
 TempENMolType := HTTPRIOENMolType as ENMolTypeControllerSoapPort;
   try
     ENMolTypeObj := TempENMolType.getObject(StrToInt(sgENMolType.Cells[0,sgENMolType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMolTypeEdit:=TfrmENMolTypeEdit.Create(Application, dsEdit);
  try
    if frmENMolTypeEdit.ShowModal= mrOk then
      begin
        //TempENMolType.save(ENMolTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMolTypeEdit.Free;
    frmENMolTypeEdit:=nil;
  end;
end;

procedure TfrmENMolTypeShow.actDeleteExecute(Sender: TObject);
Var TempENMolType: ENMolTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMolType := HTTPRIOENMolType as ENMolTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMolType.Cells[0,sgENMolType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип МВО) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMolType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMolTypeShow.actInsertExecute(Sender: TObject);
Var TempENMolType: ENMolTypeControllerSoapPort;
begin
  TempENMolType := HTTPRIOENMolType as ENMolTypeControllerSoapPort;
  ENMolTypeObj:=ENMolType.Create;



  try
    frmENMolTypeEdit:=TfrmENMolTypeEdit.Create(Application, dsInsert);
    try
      if frmENMolTypeEdit.ShowModal = mrOk then
      begin
        if ENMolTypeObj<>nil then
            //TempENMolType.add(ENMolTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMolTypeEdit.Free;
      frmENMolTypeEdit:=nil;
    end;
  finally
    ENMolTypeObj.Free;
  end;
end;

procedure TfrmENMolTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMolTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENMolTypeFilterEdit:=TfrmENMolTypeFilterEdit.Create(Application, dsInsert);
  try
    ENMolTypeFilterObj := ENMolTypeFilter.Create;
    SetNullIntProps(ENMolTypeFilterObj);
    SetNullXSProps(ENMolTypeFilterObj);

    if frmENMolTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMolTypeFilter.Create;
      FilterObject := ENMolTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMolTypeFilterEdit.Free;
    frmENMolTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENMolTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.