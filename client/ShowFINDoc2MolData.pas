
unit ShowFINDoc2MolData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINDoc2MolDataController ;


type
  TfrmFINDoc2MolDataShow = class(TChildForm)  
  HTTPRIOFINDoc2MolData: THTTPRIO;
    ImageList1: TImageList;
    sgFINDoc2MolData: TAdvStringGrid;
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
procedure sgFINDoc2MolDataTopLeftChanged(Sender: TObject);
procedure sgFINDoc2MolDataDblClick(Sender: TObject);
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
 // FINDoc2MolDataObj: FINDoc2MolData;
 // FINDoc2MolDataFilterObj: FINDoc2MolDataFilter;
  
  
implementation

uses Main, EditFINDoc2MolData, EditFINDoc2MolDataFilter;


{$R *.dfm}

var
  //frmFINDoc2MolDataShow : TfrmFINDoc2MolDataShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINDoc2MolDataHeaders: array [1..2] of String =
        ( 'Код'
          ,'код документа в ФК'
        );
   

procedure TfrmFINDoc2MolDataShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINDoc2MolDataShow:=nil;
    inherited;
  end;


procedure TfrmFINDoc2MolDataShow.FormShow(Sender: TObject);
var
  TempFINDoc2MolData: FINDoc2MolDataControllerSoapPort;
  i: Integer;
  FINDoc2MolDataList: FINDoc2MolDataShortList;
  begin
  SetGridHeaders(FINDoc2MolDataHeaders, sgFINDoc2MolData.ColumnHeaders);
  ColCount:=100;
  TempFINDoc2MolData :=  HTTPRIOFINDoc2MolData as FINDoc2MolDataControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINDoc2MolDataFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINDoc2MolDataList := TempFINDoc2MolData.getScrollableFilteredList(FINDoc2MolDataFilter(FilterObject),0,ColCount);


  LastCount:=High(FINDoc2MolDataList.list);

  if LastCount > -1 then
     sgFINDoc2MolData.RowCount:=LastCount+2
  else
     sgFINDoc2MolData.RowCount:=2;

   with sgFINDoc2MolData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINDoc2MolDataList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINDoc2MolDataList.list[i].code)
        else
        Cells[0,i+1] := '';
        if FINDoc2MolDataList.list[i].finDocCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(FINDoc2MolDataList.list[i].finDocCode);
        LastRow:=i+1;
        sgFINDoc2MolData.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINDoc2MolData.Row:=1;
end;

procedure TfrmFINDoc2MolDataShow.sgFINDoc2MolDataTopLeftChanged(Sender: TObject);
var
  TempFINDoc2MolData: FINDoc2MolDataControllerSoapPort;
  i,CurrentRow: Integer;
  FINDoc2MolDataList: FINDoc2MolDataShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINDoc2MolData.TopRow + sgFINDoc2MolData.VisibleRowCount) = ColCount
  then
    begin
      TempFINDoc2MolData :=  HTTPRIOFINDoc2MolData as FINDoc2MolDataControllerSoapPort;
      CurrentRow:=sgFINDoc2MolData.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINDoc2MolDataFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINDoc2MolDataList := TempFINDoc2MolData.getScrollableFilteredList(FINDoc2MolDataFilter(FilterObject),ColCount-1, 100);



  sgFINDoc2MolData.RowCount:=sgFINDoc2MolData.RowCount+100;
  LastCount:=High(FINDoc2MolDataList.list);
  with sgFINDoc2MolData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINDoc2MolDataList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINDoc2MolDataList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if FINDoc2MolDataList.list[i].finDocCode = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(FINDoc2MolDataList.list[i].finDocCode);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINDoc2MolData.Row:=CurrentRow-5;
   sgFINDoc2MolData.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINDoc2MolDataShow.sgFINDoc2MolDataDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINDoc2MolData,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINDoc2MolDataShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINDoc2MolData.RowCount-1 do
   for j:=0 to sgFINDoc2MolData.ColCount-1 do
     sgFINDoc2MolData.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINDoc2MolDataShow.actViewExecute(Sender: TObject);
Var TempFINDoc2MolData: FINDoc2MolDataControllerSoapPort;
begin
 TempFINDoc2MolData := HTTPRIOFINDoc2MolData as FINDoc2MolDataControllerSoapPort;
   try
     FINDoc2MolDataObj := TempFINDoc2MolData.getObject(StrToInt(sgFINDoc2MolData.Cells[0,sgFINDoc2MolData.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINDoc2MolDataEdit:=TfrmFINDoc2MolDataEdit.Create(Application, dsView);
  try
    frmFINDoc2MolDataEdit.ShowModal;
  finally
    frmFINDoc2MolDataEdit.Free;
    frmFINDoc2MolDataEdit:=nil;
  end;
end;

procedure TfrmFINDoc2MolDataShow.actEditExecute(Sender: TObject);
Var TempFINDoc2MolData: FINDoc2MolDataControllerSoapPort;
begin
 TempFINDoc2MolData := HTTPRIOFINDoc2MolData as FINDoc2MolDataControllerSoapPort;
   try
     FINDoc2MolDataObj := TempFINDoc2MolData.getObject(StrToInt(sgFINDoc2MolData.Cells[0,sgFINDoc2MolData.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINDoc2MolDataEdit:=TfrmFINDoc2MolDataEdit.Create(Application, dsEdit);
  try
    if frmFINDoc2MolDataEdit.ShowModal= mrOk then
      begin
        //TempFINDoc2MolData.save(FINDoc2MolDataObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINDoc2MolDataEdit.Free;
    frmFINDoc2MolDataEdit:=nil;
  end;
end;

procedure TfrmFINDoc2MolDataShow.actDeleteExecute(Sender: TObject);
Var TempFINDoc2MolData: FINDoc2MolDataControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINDoc2MolData := HTTPRIOFINDoc2MolData as FINDoc2MolDataControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINDoc2MolData.Cells[0,sgFINDoc2MolData.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв"язок документів з ФК з Актами та Нарядами) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINDoc2MolData.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINDoc2MolDataShow.actInsertExecute(Sender: TObject);
Var TempFINDoc2MolData: FINDoc2MolDataControllerSoapPort;
begin
  TempFINDoc2MolData := HTTPRIOFINDoc2MolData as FINDoc2MolDataControllerSoapPort;
  FINDoc2MolDataObj:=FINDoc2MolData.Create;



  try
    frmFINDoc2MolDataEdit:=TfrmFINDoc2MolDataEdit.Create(Application, dsInsert);
    try
      if frmFINDoc2MolDataEdit.ShowModal = mrOk then
      begin
        if FINDoc2MolDataObj<>nil then
            //TempFINDoc2MolData.add(FINDoc2MolDataObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINDoc2MolDataEdit.Free;
      frmFINDoc2MolDataEdit:=nil;
    end;
  finally
    FINDoc2MolDataObj.Free;
  end;
end;

procedure TfrmFINDoc2MolDataShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINDoc2MolDataShow.actFilterExecute(Sender: TObject);
begin
{frmFINDoc2MolDataFilterEdit:=TfrmFINDoc2MolDataFilterEdit.Create(Application, dsEdit);
  try
    FINDoc2MolDataFilterObj := FINDoc2MolDataFilter.Create;
    SetNullIntProps(FINDoc2MolDataFilterObj);
    SetNullXSProps(FINDoc2MolDataFilterObj);

    if frmFINDoc2MolDataFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINDoc2MolDataFilter.Create;
      FilterObject := FINDoc2MolDataFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINDoc2MolDataFilterEdit.Free;
    frmFINDoc2MolDataFilterEdit:=nil;
  end;}
end;

procedure TfrmFINDoc2MolDataShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.