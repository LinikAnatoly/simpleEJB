
unit ShowRQOrderType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrderTypeController, AdvObj ;


type
  TfrmRQOrderTypeShow = class(TChildForm)  
  HTTPRIORQOrderType: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrderType: TAdvStringGrid;
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
procedure sgRQOrderTypeTopLeftChanged(Sender: TObject);
procedure sgRQOrderTypeDblClick(Sender: TObject);
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
 frmRQOrderTypeShow : TfrmRQOrderTypeShow;
 // RQOrderTypeObj: RQOrderType;
 // RQOrderTypeFilterObj: RQOrderTypeFilter;
  
  
implementation

uses Main, EditRQOrderType, EditRQOrderTypeFilter;


{$R *.dfm}

var
  //frmRQOrderTypeShow : TfrmRQOrderTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrderTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Наименование '
        );
   

procedure TfrmRQOrderTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrderTypeShow:=nil;
    inherited;
  end;


procedure TfrmRQOrderTypeShow.FormShow(Sender: TObject);
var
  TempRQOrderType: RQOrderTypeControllerSoapPort;
  i: Integer;
  RQOrderTypeList: RQOrderTypeShortList;
  begin
  SetGridHeaders(RQOrderTypeHeaders, sgRQOrderType.ColumnHeaders);
  ColCount:=100;
  TempRQOrderType :=  HTTPRIORQOrderType as RQOrderTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderTypeList := TempRQOrderType.getScrollableFilteredList(RQOrderTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrderTypeList.list);

  if LastCount > -1 then
     sgRQOrderType.RowCount:=LastCount+2
  else
     sgRQOrderType.RowCount:=2;

   with sgRQOrderType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrderTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQOrderTypeList.list[i].name;
        LastRow:=i+1;
        sgRQOrderType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrderType.Row:=1;
end;

procedure TfrmRQOrderTypeShow.sgRQOrderTypeTopLeftChanged(Sender: TObject);
var
  TempRQOrderType: RQOrderTypeControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrderTypeList: RQOrderTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrderType.TopRow + sgRQOrderType.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrderType :=  HTTPRIORQOrderType as RQOrderTypeControllerSoapPort;
      CurrentRow:=sgRQOrderType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderTypeList := TempRQOrderType.getScrollableFilteredList(RQOrderTypeFilter(FilterObject),ColCount-1, 100);



  sgRQOrderType.RowCount:=sgRQOrderType.RowCount+100;
  LastCount:=High(RQOrderTypeList.list);
  with sgRQOrderType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrderTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQOrderTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrderType.Row:=CurrentRow-5;
   sgRQOrderType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrderTypeShow.sgRQOrderTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrderType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrderTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrderType.RowCount-1 do
   for j:=0 to sgRQOrderType.ColCount-1 do
     sgRQOrderType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrderTypeShow.actViewExecute(Sender: TObject);
Var TempRQOrderType: RQOrderTypeControllerSoapPort;
begin
 TempRQOrderType := HTTPRIORQOrderType as RQOrderTypeControllerSoapPort;
   try
     RQOrderTypeObj := TempRQOrderType.getObject(StrToInt(sgRQOrderType.Cells[0,sgRQOrderType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderTypeEdit:=TfrmRQOrderTypeEdit.Create(Application, dsView);
  try
    frmRQOrderTypeEdit.ShowModal;
  finally
    frmRQOrderTypeEdit.Free;
    frmRQOrderTypeEdit:=nil;
  end;
end;

procedure TfrmRQOrderTypeShow.actEditExecute(Sender: TObject);
Var TempRQOrderType: RQOrderTypeControllerSoapPort;
begin
 TempRQOrderType := HTTPRIORQOrderType as RQOrderTypeControllerSoapPort;
   try
     RQOrderTypeObj := TempRQOrderType.getObject(StrToInt(sgRQOrderType.Cells[0,sgRQOrderType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderTypeEdit:=TfrmRQOrderTypeEdit.Create(Application, dsEdit);
  try
    if frmRQOrderTypeEdit.ShowModal= mrOk then
      begin
        //TempRQOrderType.save(RQOrderTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrderTypeEdit.Free;
    frmRQOrderTypeEdit:=nil;
  end;
end;

procedure TfrmRQOrderTypeShow.actDeleteExecute(Sender: TObject);
Var TempRQOrderType: RQOrderTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrderType := HTTPRIORQOrderType as RQOrderTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrderType.Cells[0,sgRQOrderType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип заявки (1 - Бюджетная, 2 - Инвестпрограмма)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrderType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrderTypeShow.actInsertExecute(Sender: TObject);
Var TempRQOrderType: RQOrderTypeControllerSoapPort;
begin
  TempRQOrderType := HTTPRIORQOrderType as RQOrderTypeControllerSoapPort;
  RQOrderTypeObj:=RQOrderType.Create;



  try
    frmRQOrderTypeEdit:=TfrmRQOrderTypeEdit.Create(Application, dsInsert);
    try
      if frmRQOrderTypeEdit.ShowModal = mrOk then
      begin
        if RQOrderTypeObj<>nil then
            //TempRQOrderType.add(RQOrderTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrderTypeEdit.Free;
      frmRQOrderTypeEdit:=nil;
    end;
  finally
    RQOrderTypeObj.Free;
  end;
end;

procedure TfrmRQOrderTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrderTypeShow.actFilterExecute(Sender: TObject);
begin
{frmRQOrderTypeFilterEdit:=TfrmRQOrderTypeFilterEdit.Create(Application, dsEdit);
  try
    RQOrderTypeFilterObj := RQOrderTypeFilter.Create;
    SetNullIntProps(RQOrderTypeFilterObj);
    SetNullXSProps(RQOrderTypeFilterObj);

    if frmRQOrderTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrderTypeFilter.Create;
      FilterObject := RQOrderTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrderTypeFilterEdit.Free;
    frmRQOrderTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmRQOrderTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.