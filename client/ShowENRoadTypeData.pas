
unit ShowENRoadTypeData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENRoadTypeDataController, AdvObj ;


type
  TfrmENRoadTypeDataShow = class(TChildForm)  
  HTTPRIOENRoadTypeData: THTTPRIO;
    ImageList1: TImageList;
    sgENRoadTypeData: TAdvStringGrid;
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
procedure sgENRoadTypeDataTopLeftChanged(Sender: TObject);
procedure sgENRoadTypeDataDblClick(Sender: TObject);
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
 // ENRoadTypeDataObj: ENRoadTypeData;
 // ENRoadTypeDataFilterObj: ENRoadTypeDataFilter;
  
  
implementation

uses Main, EditENRoadTypeData, EditENRoadTypeDataFilter;


{$R *.dfm}

var
  //frmENRoadTypeDataShow : TfrmENRoadTypeDataShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENRoadTypeDataHeaders: array [1..5] of String =
        ( 'Код'
          ,'Швидкість , км/г'
          ,'Відстань , км'
          ,'Зима(1) / Літо(0)'
          ,'коєфициент'
        );
   

procedure TfrmENRoadTypeDataShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENRoadTypeDataShow:=nil;
    inherited;
  end;


procedure TfrmENRoadTypeDataShow.FormShow(Sender: TObject);
var
  TempENRoadTypeData: ENRoadTypeDataControllerSoapPort;
  i: Integer;
  ENRoadTypeDataList: ENRoadTypeDataShortList;
  begin
  SetGridHeaders(ENRoadTypeDataHeaders, sgENRoadTypeData.ColumnHeaders);
  ColCount:=100;
  TempENRoadTypeData :=  HTTPRIOENRoadTypeData as ENRoadTypeDataControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENRoadTypeDataFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRoadTypeDataList := TempENRoadTypeData.getScrollableFilteredList(ENRoadTypeDataFilter(FilterObject),0,ColCount);


  LastCount:=High(ENRoadTypeDataList.list);

  if LastCount > -1 then
     sgENRoadTypeData.RowCount:=LastCount+2
  else
     sgENRoadTypeData.RowCount:=2;

   with sgENRoadTypeData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRoadTypeDataList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENRoadTypeDataList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENRoadTypeDataList.list[i].speed = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := ENRoadTypeDataList.list[i].speed.DecimalString;
        if ENRoadTypeDataList.list[i].distance = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENRoadTypeDataList.list[i].distance.DecimalString;
        if ENRoadTypeDataList.list[i].isWinter = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENRoadTypeDataList.list[i].isWinter);
        if ENRoadTypeDataList.list[i].coeff = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENRoadTypeDataList.list[i].coeff.DecimalString;
        LastRow:=i+1;
        sgENRoadTypeData.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENRoadTypeData.Row:=1;
end;

procedure TfrmENRoadTypeDataShow.sgENRoadTypeDataTopLeftChanged(Sender: TObject);
var
  TempENRoadTypeData: ENRoadTypeDataControllerSoapPort;
  i,CurrentRow: Integer;
  ENRoadTypeDataList: ENRoadTypeDataShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENRoadTypeData.TopRow + sgENRoadTypeData.VisibleRowCount) = ColCount
  then
    begin
      TempENRoadTypeData :=  HTTPRIOENRoadTypeData as ENRoadTypeDataControllerSoapPort;
      CurrentRow:=sgENRoadTypeData.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENRoadTypeDataFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRoadTypeDataList := TempENRoadTypeData.getScrollableFilteredList(ENRoadTypeDataFilter(FilterObject),ColCount-1, 100);



  sgENRoadTypeData.RowCount:=sgENRoadTypeData.RowCount+100;
  LastCount:=High(ENRoadTypeDataList.list);
  with sgENRoadTypeData do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRoadTypeDataList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENRoadTypeDataList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENRoadTypeDataList.list[i].speed = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENRoadTypeDataList.list[i].speed.DecimalString;
        if ENRoadTypeDataList.list[i].distance = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENRoadTypeDataList.list[i].distance.DecimalString;
        if ENRoadTypeDataList.list[i].isWinter = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENRoadTypeDataList.list[i].isWinter);
        if ENRoadTypeDataList.list[i].coeff = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENRoadTypeDataList.list[i].coeff.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENRoadTypeData.Row:=CurrentRow-5;
   sgENRoadTypeData.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENRoadTypeDataShow.sgENRoadTypeDataDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENRoadTypeData,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENRoadTypeDataShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENRoadTypeData.RowCount-1 do
   for j:=0 to sgENRoadTypeData.ColCount-1 do
     sgENRoadTypeData.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENRoadTypeDataShow.actViewExecute(Sender: TObject);
Var TempENRoadTypeData: ENRoadTypeDataControllerSoapPort;
begin
 TempENRoadTypeData := HTTPRIOENRoadTypeData as ENRoadTypeDataControllerSoapPort;
   try
     ENRoadTypeDataObj := TempENRoadTypeData.getObject(StrToInt(sgENRoadTypeData.Cells[0,sgENRoadTypeData.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENRoadTypeDataEdit:=TfrmENRoadTypeDataEdit.Create(Application, dsView);
  try
    frmENRoadTypeDataEdit.ShowModal;
  finally
    frmENRoadTypeDataEdit.Free;
    frmENRoadTypeDataEdit:=nil;
  end;
end;

procedure TfrmENRoadTypeDataShow.actEditExecute(Sender: TObject);
Var TempENRoadTypeData: ENRoadTypeDataControllerSoapPort;
begin
 TempENRoadTypeData := HTTPRIOENRoadTypeData as ENRoadTypeDataControllerSoapPort;
   try
     ENRoadTypeDataObj := TempENRoadTypeData.getObject(StrToInt(sgENRoadTypeData.Cells[0,sgENRoadTypeData.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENRoadTypeDataEdit:=TfrmENRoadTypeDataEdit.Create(Application, dsEdit);
  try
    if frmENRoadTypeDataEdit.ShowModal= mrOk then
      begin
        //TempENRoadTypeData.save(ENRoadTypeDataObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENRoadTypeDataEdit.Free;
    frmENRoadTypeDataEdit:=nil;
  end;
end;

procedure TfrmENRoadTypeDataShow.actDeleteExecute(Sender: TObject);
Var TempENRoadTypeData: ENRoadTypeDataControllerSoapPort;
  ObjCode: Integer;
begin
 TempENRoadTypeData := HTTPRIOENRoadTypeData as ENRoadTypeDataControllerSoapPort;
   try
     ObjCode := StrToInt(sgENRoadTypeData.Cells[0,sgENRoadTypeData.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип дороги) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENRoadTypeData.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENRoadTypeDataShow.actInsertExecute(Sender: TObject);
Var TempENRoadTypeData: ENRoadTypeDataControllerSoapPort;
begin
  TempENRoadTypeData := HTTPRIOENRoadTypeData as ENRoadTypeDataControllerSoapPort;
  ENRoadTypeDataObj:=ENRoadTypeData.Create;

   ENRoadTypeDataObj.speed:= TXSDecimal.Create;
   ENRoadTypeDataObj.distance:= TXSDecimal.Create;
   ENRoadTypeDataObj.coeff:= TXSDecimal.Create;


  try
    frmENRoadTypeDataEdit:=TfrmENRoadTypeDataEdit.Create(Application, dsInsert);
    try
      if frmENRoadTypeDataEdit.ShowModal = mrOk then
      begin
        if ENRoadTypeDataObj<>nil then
            //TempENRoadTypeData.add(ENRoadTypeDataObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENRoadTypeDataEdit.Free;
      frmENRoadTypeDataEdit:=nil;
    end;
  finally
    ENRoadTypeDataObj.Free;
  end;
end;

procedure TfrmENRoadTypeDataShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENRoadTypeDataShow.actFilterExecute(Sender: TObject);
begin
{frmENRoadTypeDataFilterEdit:=TfrmENRoadTypeDataFilterEdit.Create(Application, dsEdit);
  try
    ENRoadTypeDataFilterObj := ENRoadTypeDataFilter.Create;
    SetNullIntProps(ENRoadTypeDataFilterObj);
    SetNullXSProps(ENRoadTypeDataFilterObj);

    if frmENRoadTypeDataFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENRoadTypeDataFilter.Create;
      FilterObject := ENRoadTypeDataFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENRoadTypeDataFilterEdit.Free;
    frmENRoadTypeDataFilterEdit:=nil;
  end;}
end;

procedure TfrmENRoadTypeDataShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.