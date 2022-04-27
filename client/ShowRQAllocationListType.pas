
unit ShowRQAllocationListType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQAllocationListTypeController, AdvObj ;


type
  TfrmRQAllocationListTypeShow = class(TChildForm)  
  HTTPRIORQAllocationListType: THTTPRIO;
    ImageList1: TImageList;
    sgRQAllocationListType: TAdvStringGrid;
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
procedure sgRQAllocationListTypeTopLeftChanged(Sender: TObject);
procedure sgRQAllocationListTypeDblClick(Sender: TObject);
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
 // RQAllocationListTypeObj: RQAllocationListType;
 // RQAllocationListTypeFilterObj: RQAllocationListTypeFilter;
  
  
implementation

uses Main, EditRQAllocationListType, EditRQAllocationListTypeFilter;


{$R *.dfm}

var
  //frmRQAllocationListTypeShow : TfrmRQAllocationListTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQAllocationListTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Назва типу'
        );
   

procedure TfrmRQAllocationListTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQAllocationListTypeShow:=nil;
    inherited;
  end;


procedure TfrmRQAllocationListTypeShow.FormShow(Sender: TObject);
var
  TempRQAllocationListType: RQAllocationListTypeControllerSoapPort;
  i: Integer;
  RQAllocationListTypeList: RQAllocationListTypeShortList;
  begin
  SetGridHeaders(RQAllocationListTypeHeaders, sgRQAllocationListType.ColumnHeaders);
  ColCount:=100;
  TempRQAllocationListType :=  HTTPRIORQAllocationListType as RQAllocationListTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQAllocationListTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQAllocationListTypeList := TempRQAllocationListType.getScrollableFilteredList(RQAllocationListTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(RQAllocationListTypeList.list);

  if LastCount > -1 then
     sgRQAllocationListType.RowCount:=LastCount+2
  else
     sgRQAllocationListType.RowCount:=2;

   with sgRQAllocationListType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQAllocationListTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQAllocationListTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQAllocationListTypeList.list[i].name;
        LastRow:=i+1;
        sgRQAllocationListType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQAllocationListType.Row:=1;
end;

procedure TfrmRQAllocationListTypeShow.sgRQAllocationListTypeTopLeftChanged(Sender: TObject);
var
  TempRQAllocationListType: RQAllocationListTypeControllerSoapPort;
  i,CurrentRow: Integer;
  RQAllocationListTypeList: RQAllocationListTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQAllocationListType.TopRow + sgRQAllocationListType.VisibleRowCount) = ColCount
  then
    begin
      TempRQAllocationListType :=  HTTPRIORQAllocationListType as RQAllocationListTypeControllerSoapPort;
      CurrentRow:=sgRQAllocationListType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQAllocationListTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQAllocationListTypeList := TempRQAllocationListType.getScrollableFilteredList(RQAllocationListTypeFilter(FilterObject),ColCount-1, 100);



  sgRQAllocationListType.RowCount:=sgRQAllocationListType.RowCount+100;
  LastCount:=High(RQAllocationListTypeList.list);
  with sgRQAllocationListType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQAllocationListTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQAllocationListTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQAllocationListTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQAllocationListType.Row:=CurrentRow-5;
   sgRQAllocationListType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQAllocationListTypeShow.sgRQAllocationListTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQAllocationListType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQAllocationListTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQAllocationListType.RowCount-1 do
   for j:=0 to sgRQAllocationListType.ColCount-1 do
     sgRQAllocationListType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQAllocationListTypeShow.actViewExecute(Sender: TObject);
Var TempRQAllocationListType: RQAllocationListTypeControllerSoapPort;
begin
 TempRQAllocationListType := HTTPRIORQAllocationListType as RQAllocationListTypeControllerSoapPort;
   try
     RQAllocationListTypeObj := TempRQAllocationListType.getObject(StrToInt(sgRQAllocationListType.Cells[0,sgRQAllocationListType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQAllocationListTypeEdit:=TfrmRQAllocationListTypeEdit.Create(Application, dsView);
  try
    frmRQAllocationListTypeEdit.ShowModal;
  finally
    frmRQAllocationListTypeEdit.Free;
    frmRQAllocationListTypeEdit:=nil;
  end;
end;

procedure TfrmRQAllocationListTypeShow.actEditExecute(Sender: TObject);
Var TempRQAllocationListType: RQAllocationListTypeControllerSoapPort;
begin
 TempRQAllocationListType := HTTPRIORQAllocationListType as RQAllocationListTypeControllerSoapPort;
   try
     RQAllocationListTypeObj := TempRQAllocationListType.getObject(StrToInt(sgRQAllocationListType.Cells[0,sgRQAllocationListType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQAllocationListTypeEdit:=TfrmRQAllocationListTypeEdit.Create(Application, dsEdit);
  try
    if frmRQAllocationListTypeEdit.ShowModal= mrOk then
      begin
        //TempRQAllocationListType.save(RQAllocationListTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQAllocationListTypeEdit.Free;
    frmRQAllocationListTypeEdit:=nil;
  end;
end;

procedure TfrmRQAllocationListTypeShow.actDeleteExecute(Sender: TObject);
Var TempRQAllocationListType: RQAllocationListTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQAllocationListType := HTTPRIORQAllocationListType as RQAllocationListTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQAllocationListType.Cells[0,sgRQAllocationListType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Типи відомості розподілу залишків (Бюджетна, Інвестпрограма...) ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQAllocationListType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQAllocationListTypeShow.actInsertExecute(Sender: TObject);
// Var TempRQAllocationListType: RQAllocationListTypeControllerSoapPort; 
begin
  // TempRQAllocationListType := HTTPRIORQAllocationListType as RQAllocationListTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQAllocationListTypeObj:=RQAllocationListType.Create;



  try
    frmRQAllocationListTypeEdit:=TfrmRQAllocationListTypeEdit.Create(Application, dsInsert);
    try
      if frmRQAllocationListTypeEdit.ShowModal = mrOk then
      begin
        if RQAllocationListTypeObj<>nil then
            //TempRQAllocationListType.add(RQAllocationListTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQAllocationListTypeEdit.Free;
      frmRQAllocationListTypeEdit:=nil;
    end;
  finally
    RQAllocationListTypeObj.Free;
  end;
end;

procedure TfrmRQAllocationListTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQAllocationListTypeShow.actFilterExecute(Sender: TObject);
begin
{frmRQAllocationListTypeFilterEdit:=TfrmRQAllocationListTypeFilterEdit.Create(Application, dsInsert);
  try
    RQAllocationListTypeFilterObj := RQAllocationListTypeFilter.Create;
    SetNullIntProps(RQAllocationListTypeFilterObj);
    SetNullXSProps(RQAllocationListTypeFilterObj);

    if frmRQAllocationListTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQAllocationListTypeFilter.Create;
      FilterObject := RQAllocationListTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQAllocationListTypeFilterEdit.Free;
    frmRQAllocationListTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmRQAllocationListTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.