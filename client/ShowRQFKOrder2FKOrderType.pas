
unit ShowRQFKOrder2FKOrderType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQFKOrder2FKOrderTypeController, AdvObj ;


type
  TfrmRQFKOrder2FKOrderTypeShow = class(TChildForm)  
  HTTPRIORQFKOrder2FKOrderType: THTTPRIO;
    ImageList1: TImageList;
    sgRQFKOrder2FKOrderType: TAdvStringGrid;
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
procedure sgRQFKOrder2FKOrderTypeTopLeftChanged(Sender: TObject);
procedure sgRQFKOrder2FKOrderTypeDblClick(Sender: TObject);
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
 // RQFKOrder2FKOrderTypeObj: RQFKOrder2FKOrderType;
 // RQFKOrder2FKOrderTypeFilterObj: RQFKOrder2FKOrderTypeFilter;
  
  
implementation

uses Main, EditRQFKOrder2FKOrderType, EditRQFKOrder2FKOrderTypeFilter;


{$R *.dfm}

var
  //frmRQFKOrder2FKOrderTypeShow : TfrmRQFKOrder2FKOrderTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQFKOrder2FKOrderTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип зв_язку ордеру'
        );
   

procedure TfrmRQFKOrder2FKOrderTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQFKOrder2FKOrderTypeShow:=nil;
    inherited;
  end;


procedure TfrmRQFKOrder2FKOrderTypeShow.FormShow(Sender: TObject);
var
  TempRQFKOrder2FKOrderType: RQFKOrder2FKOrderTypeControllerSoapPort;
  i: Integer;
  RQFKOrder2FKOrderTypeList: RQFKOrder2FKOrderTypeShortList;
  begin
  SetGridHeaders(RQFKOrder2FKOrderTypeHeaders, sgRQFKOrder2FKOrderType.ColumnHeaders);
  ColCount:=100;
  TempRQFKOrder2FKOrderType :=  HTTPRIORQFKOrder2FKOrderType as RQFKOrder2FKOrderTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrder2FKOrderTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrder2FKOrderTypeList := TempRQFKOrder2FKOrderType.getScrollableFilteredList(RQFKOrder2FKOrderTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(RQFKOrder2FKOrderTypeList.list);

  if LastCount > -1 then
     sgRQFKOrder2FKOrderType.RowCount:=LastCount+2
  else
     sgRQFKOrder2FKOrderType.RowCount:=2;

   with sgRQFKOrder2FKOrderType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrder2FKOrderTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrder2FKOrderTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQFKOrder2FKOrderTypeList.list[i].name;
        LastRow:=i+1;
        sgRQFKOrder2FKOrderType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQFKOrder2FKOrderType.Row:=1;
end;

procedure TfrmRQFKOrder2FKOrderTypeShow.sgRQFKOrder2FKOrderTypeTopLeftChanged(Sender: TObject);
var
  TempRQFKOrder2FKOrderType: RQFKOrder2FKOrderTypeControllerSoapPort;
  i,CurrentRow: Integer;
  RQFKOrder2FKOrderTypeList: RQFKOrder2FKOrderTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQFKOrder2FKOrderType.TopRow + sgRQFKOrder2FKOrderType.VisibleRowCount) = ColCount
  then
    begin
      TempRQFKOrder2FKOrderType :=  HTTPRIORQFKOrder2FKOrderType as RQFKOrder2FKOrderTypeControllerSoapPort;
      CurrentRow:=sgRQFKOrder2FKOrderType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrder2FKOrderTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrder2FKOrderTypeList := TempRQFKOrder2FKOrderType.getScrollableFilteredList(RQFKOrder2FKOrderTypeFilter(FilterObject),ColCount-1, 100);



  sgRQFKOrder2FKOrderType.RowCount:=sgRQFKOrder2FKOrderType.RowCount+100;
  LastCount:=High(RQFKOrder2FKOrderTypeList.list);
  with sgRQFKOrder2FKOrderType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQFKOrder2FKOrderTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQFKOrder2FKOrderTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQFKOrder2FKOrderTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQFKOrder2FKOrderType.Row:=CurrentRow-5;
   sgRQFKOrder2FKOrderType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQFKOrder2FKOrderTypeShow.sgRQFKOrder2FKOrderTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQFKOrder2FKOrderType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQFKOrder2FKOrderTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQFKOrder2FKOrderType.RowCount-1 do
   for j:=0 to sgRQFKOrder2FKOrderType.ColCount-1 do
     sgRQFKOrder2FKOrderType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQFKOrder2FKOrderTypeShow.actViewExecute(Sender: TObject);
Var TempRQFKOrder2FKOrderType: RQFKOrder2FKOrderTypeControllerSoapPort;
begin
 TempRQFKOrder2FKOrderType := HTTPRIORQFKOrder2FKOrderType as RQFKOrder2FKOrderTypeControllerSoapPort;
   try
     RQFKOrder2FKOrderTypeObj := TempRQFKOrder2FKOrderType.getObject(StrToInt(sgRQFKOrder2FKOrderType.Cells[0,sgRQFKOrder2FKOrderType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrder2FKOrderTypeEdit:=TfrmRQFKOrder2FKOrderTypeEdit.Create(Application, dsView);
  try
    frmRQFKOrder2FKOrderTypeEdit.ShowModal;
  finally
    frmRQFKOrder2FKOrderTypeEdit.Free;
    frmRQFKOrder2FKOrderTypeEdit:=nil;
  end;
end;

procedure TfrmRQFKOrder2FKOrderTypeShow.actEditExecute(Sender: TObject);
Var TempRQFKOrder2FKOrderType: RQFKOrder2FKOrderTypeControllerSoapPort;
begin
 TempRQFKOrder2FKOrderType := HTTPRIORQFKOrder2FKOrderType as RQFKOrder2FKOrderTypeControllerSoapPort;
   try
     RQFKOrder2FKOrderTypeObj := TempRQFKOrder2FKOrderType.getObject(StrToInt(sgRQFKOrder2FKOrderType.Cells[0,sgRQFKOrder2FKOrderType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQFKOrder2FKOrderTypeEdit:=TfrmRQFKOrder2FKOrderTypeEdit.Create(Application, dsEdit);
  try
    if frmRQFKOrder2FKOrderTypeEdit.ShowModal= mrOk then
      begin
        //TempRQFKOrder2FKOrderType.save(RQFKOrder2FKOrderTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQFKOrder2FKOrderTypeEdit.Free;
    frmRQFKOrder2FKOrderTypeEdit:=nil;
  end;
end;

procedure TfrmRQFKOrder2FKOrderTypeShow.actDeleteExecute(Sender: TObject);
Var TempRQFKOrder2FKOrderType: RQFKOrder2FKOrderTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQFKOrder2FKOrderType := HTTPRIORQFKOrder2FKOrderType as RQFKOrder2FKOrderTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQFKOrder2FKOrderType.Cells[0,sgRQFKOrder2FKOrderType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип звязку ордерів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQFKOrder2FKOrderType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQFKOrder2FKOrderTypeShow.actInsertExecute(Sender: TObject);
Var TempRQFKOrder2FKOrderType: RQFKOrder2FKOrderTypeControllerSoapPort;
begin
  TempRQFKOrder2FKOrderType := HTTPRIORQFKOrder2FKOrderType as RQFKOrder2FKOrderTypeControllerSoapPort;
  RQFKOrder2FKOrderTypeObj:=RQFKOrder2FKOrderType.Create;



  try
    frmRQFKOrder2FKOrderTypeEdit:=TfrmRQFKOrder2FKOrderTypeEdit.Create(Application, dsInsert);
    try
      if frmRQFKOrder2FKOrderTypeEdit.ShowModal = mrOk then
      begin
        if RQFKOrder2FKOrderTypeObj<>nil then
            //TempRQFKOrder2FKOrderType.add(RQFKOrder2FKOrderTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQFKOrder2FKOrderTypeEdit.Free;
      frmRQFKOrder2FKOrderTypeEdit:=nil;
    end;
  finally
    RQFKOrder2FKOrderTypeObj.Free;
  end;
end;

procedure TfrmRQFKOrder2FKOrderTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQFKOrder2FKOrderTypeShow.actFilterExecute(Sender: TObject);
begin
{frmRQFKOrder2FKOrderTypeFilterEdit:=TfrmRQFKOrder2FKOrderTypeFilterEdit.Create(Application, dsEdit);
  try
    RQFKOrder2FKOrderTypeFilterObj := RQFKOrder2FKOrderTypeFilter.Create;
    SetNullIntProps(RQFKOrder2FKOrderTypeFilterObj);
    SetNullXSProps(RQFKOrder2FKOrderTypeFilterObj);

    if frmRQFKOrder2FKOrderTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQFKOrder2FKOrderTypeFilter.Create;
      FilterObject := RQFKOrder2FKOrderTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQFKOrder2FKOrderTypeFilterEdit.Free;
    frmRQFKOrder2FKOrderTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmRQFKOrder2FKOrderTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.