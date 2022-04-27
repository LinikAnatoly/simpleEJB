
unit ShowFINMolData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINMolDataController, AdvObj ;


type
  TfrmFINMolDataShow = class(TChildForm)  
  HTTPRIOFINMolData: THTTPRIO;
    ImageList1: TImageList;
    sgFINMolData: TAdvStringGrid;
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
procedure sgFINMolDataTopLeftChanged(Sender: TObject);
procedure sgFINMolDataDblClick(Sender: TObject);
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
 frmFINMolDataShow : TfrmFINMolDataShow;
 // FINMolDataObj: FINMolData;
 // FINMolDataFilterObj: FINMolDataFilter;
  
  
implementation

uses Main, EditFINMolData, EditFINMolDataFilter, ENConsts;


{$R *.dfm}

var
  //frmFINMolDataShow : TfrmFINMolDataShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINMolDataHeaders: array [1..4] of String =
        ( 'Код'
          ,'код МОЛа'
          ,'ФИО МОЛа'
          ,'Тип МОЛа'
        );
   

procedure TfrmFINMolDataShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINMolDataShow:=nil;
    inherited;
  end;


procedure TfrmFINMolDataShow.FormShow(Sender: TObject);
var
  TempFINMolData: FINMolDataControllerSoapPort;
  i: Integer;
  FINMolDataList: FINMolDataShortList;
  begin
  SetGridHeaders(FINMolDataHeaders, sgFINMolData.ColumnHeaders);
  ColCount:=100;
  TempFINMolData :=  HTTPRIOFINMolData as FINMolDataControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINMolDataFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINMolDataList := TempFINMolData.getScrollableFilteredList(FINMolDataFilter(FilterObject),0,ColCount);


  LastCount:=High(FINMolDataList.list);

  if LastCount > -1 then
     sgFINMolData.RowCount:=LastCount+2
  else
     sgFINMolData.RowCount:=2;

   with sgFINMolData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINMolDataList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINMolDataList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINMolDataList.list[i].finMolCode;
        Cells[2,i+1] := FINMolDataList.list[i].finMolName;
        Cells[3,i+1] := FINMolDataList.list[i].molTypeRefName;
        LastRow:=i+1;
        sgFINMolData.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINMolData.Row:=1;
end;

procedure TfrmFINMolDataShow.sgFINMolDataTopLeftChanged(Sender: TObject);
var
  TempFINMolData: FINMolDataControllerSoapPort;
  i,CurrentRow: Integer;
  FINMolDataList: FINMolDataShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINMolData.TopRow + sgFINMolData.VisibleRowCount) = ColCount
  then
    begin
      TempFINMolData :=  HTTPRIOFINMolData as FINMolDataControllerSoapPort;
      CurrentRow:=sgFINMolData.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINMolDataFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  FINMolDataList := TempFINMolData.getScrollableFilteredList(FINMolDataFilter(FilterObject),ColCount-1, 100);



  sgFINMolData.RowCount:=sgFINMolData.RowCount+100;
  LastCount:=High(FINMolDataList.list);
  with sgFINMolData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINMolDataList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINMolDataList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := FINMolDataList.list[i].finMolCode;
        Cells[2,i+CurrentRow] := FINMolDataList.list[i].finMolName;
        Cells[3,i+CurrentRow] := FINMolDataList.list[i].molTypeRefName;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINMolData.Row:=CurrentRow-5;
   sgFINMolData.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINMolDataShow.sgFINMolDataDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINMolData,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINMolDataShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINMolData.RowCount-1 do
   for j:=0 to sgFINMolData.ColCount-1 do
     sgFINMolData.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINMolDataShow.actViewExecute(Sender: TObject);
Var TempFINMolData: FINMolDataControllerSoapPort;
begin
 TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;
   try
     FINMolDataObj := TempFINMolData.getObject(StrToInt(sgFINMolData.Cells[0,sgFINMolData.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINMolDataEdit:=TfrmFINMolDataEdit.Create(Application, dsView);
  try
    frmFINMolDataEdit.ShowModal;
  finally
    frmFINMolDataEdit.Free;
    frmFINMolDataEdit:=nil;
  end;
end;

procedure TfrmFINMolDataShow.actEditExecute(Sender: TObject);
Var TempFINMolData: FINMolDataControllerSoapPort;
begin
 TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;
   try
     FINMolDataObj := TempFINMolData.getObject(StrToInt(sgFINMolData.Cells[0,sgFINMolData.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINMolDataEdit:=TfrmFINMolDataEdit.Create(Application, dsEdit);
  try
    if frmFINMolDataEdit.ShowModal= mrOk then
      begin
        //TempFINMolData.save(FINMolDataObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINMolDataEdit.Free;
    frmFINMolDataEdit:=nil;
  end;
end;

procedure TfrmFINMolDataShow.actDeleteExecute(Sender: TObject);
Var TempFINMolData: FINMolDataControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINMolData.Cells[0,sgFINMolData.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (МОЛы для нарядов и актов) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINMolData.remove(ObjCode, LOW_INT, LOW_INT);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINMolDataShow.actInsertExecute(Sender: TObject);
Var TempFINMolData: FINMolDataControllerSoapPort;
begin
  TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;
  FINMolDataObj:=FINMolData.Create;



  try
    frmFINMolDataEdit:=TfrmFINMolDataEdit.Create(Application, dsInsert);
    try
      if frmFINMolDataEdit.ShowModal = mrOk then
      begin
        if FINMolDataObj<>nil then
            //TempFINMolData.add(FINMolDataObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINMolDataEdit.Free;
      frmFINMolDataEdit:=nil;
    end;
  finally
    FINMolDataObj.Free;
  end;
end;

procedure TfrmFINMolDataShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINMolDataShow.actFilterExecute(Sender: TObject);
begin
{frmFINMolDataFilterEdit:=TfrmFINMolDataFilterEdit.Create(Application, dsEdit);
  try
    FINMolDataFilterObj := FINMolDataFilter.Create;
    SetNullIntProps(FINMolDataFilterObj);
    SetNullXSProps(FINMolDataFilterObj);

    if frmFINMolDataFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINMolDataFilter.Create;
      FilterObject := FINMolDataFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINMolDataFilterEdit.Free;
    frmFINMolDataFilterEdit:=nil;
  end;}
end;

procedure TfrmFINMolDataShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.