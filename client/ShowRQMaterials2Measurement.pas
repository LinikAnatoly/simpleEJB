
unit ShowRQMaterials2Measurement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQMaterials2MeasurementController;


type
  TfrmRQMaterials2MeasurementShow = class(TChildForm)  
  HTTPRIORQMaterials2Measurement: THTTPRIO;
    ImageList1: TImageList;
    sgRQMaterials2Measurement: TAdvStringGrid;
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
procedure sgRQMaterials2MeasurementTopLeftChanged(Sender: TObject);
procedure sgRQMaterials2MeasurementDblClick(Sender: TObject);
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

var frmRQMaterials2MeasurementShow: TfrmRQMaterials2MeasurementShow;
 // RQMaterials2MeasurementObj: RQMaterials2Measurement;
 // RQMaterials2MeasurementFilterObj: RQMaterials2MeasurementFilter;

implementation

uses Main, EditRQMaterials2Measurement, EditRQMaterials2MeasurementFilter;

{$R *.dfm}

var ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQMaterials2MeasurementHeaders: array [1..2] of String =
        ( 'Код'
          ,'Коєф. перерахунку'
        );
   

procedure TfrmRQMaterials2MeasurementShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQMaterials2MeasurementShow:=nil;
    inherited;
  end;


procedure TfrmRQMaterials2MeasurementShow.FormShow(Sender: TObject);
var
  TempRQMaterials2Measurement: RQMaterials2MeasurementControllerSoapPort;
  i: Integer;
  RQMaterials2MeasurementList: RQMaterials2MeasurementShortList;
  begin
  SetGridHeaders(RQMaterials2MeasurementHeaders, sgRQMaterials2Measurement.ColumnHeaders);
  ColCount:=100;
  TempRQMaterials2Measurement :=  HTTPRIORQMaterials2Measurement as RQMaterials2MeasurementControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQMaterials2MeasurementFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQMaterials2MeasurementList := TempRQMaterials2Measurement.getScrollableFilteredList(RQMaterials2MeasurementFilter(FilterObject),0,ColCount);


  LastCount:=High(RQMaterials2MeasurementList.list);

  if LastCount > -1 then
     sgRQMaterials2Measurement.RowCount:=LastCount+2
  else
     sgRQMaterials2Measurement.RowCount:=2;

   with sgRQMaterials2Measurement do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQMaterials2MeasurementList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQMaterials2MeasurementList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQMaterials2MeasurementList.list[i].coef = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := RQMaterials2MeasurementList.list[i].coef.DecimalString;
        LastRow:=i+1;
        sgRQMaterials2Measurement.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQMaterials2Measurement.Row:=1;
end;

procedure TfrmRQMaterials2MeasurementShow.sgRQMaterials2MeasurementTopLeftChanged(Sender: TObject);
var
  TempRQMaterials2Measurement: RQMaterials2MeasurementControllerSoapPort;
  i,CurrentRow: Integer;
  RQMaterials2MeasurementList: RQMaterials2MeasurementShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQMaterials2Measurement.TopRow + sgRQMaterials2Measurement.VisibleRowCount) = ColCount
  then
    begin
      TempRQMaterials2Measurement :=  HTTPRIORQMaterials2Measurement as RQMaterials2MeasurementControllerSoapPort;
      CurrentRow:=sgRQMaterials2Measurement.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQMaterials2MeasurementFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQMaterials2MeasurementList := TempRQMaterials2Measurement.getScrollableFilteredList(RQMaterials2MeasurementFilter(FilterObject),ColCount-1, 100);



  sgRQMaterials2Measurement.RowCount:=sgRQMaterials2Measurement.RowCount+100;
  LastCount:=High(RQMaterials2MeasurementList.list);
  with sgRQMaterials2Measurement do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQMaterials2MeasurementList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQMaterials2MeasurementList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQMaterials2MeasurementList.list[i].coef = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := RQMaterials2MeasurementList.list[i].coef.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQMaterials2Measurement.Row:=CurrentRow-5;
   sgRQMaterials2Measurement.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQMaterials2MeasurementShow.sgRQMaterials2MeasurementDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQMaterials2Measurement,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQMaterials2MeasurementShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQMaterials2Measurement.RowCount-1 do
   for j:=0 to sgRQMaterials2Measurement.ColCount-1 do
     sgRQMaterials2Measurement.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQMaterials2MeasurementShow.actViewExecute(Sender: TObject);
Var TempRQMaterials2Measurement: RQMaterials2MeasurementControllerSoapPort;
begin
 TempRQMaterials2Measurement := HTTPRIORQMaterials2Measurement as RQMaterials2MeasurementControllerSoapPort;
   try
     RQMaterials2MeasurementObj := TempRQMaterials2Measurement.getObject(StrToInt(sgRQMaterials2Measurement.Cells[0,sgRQMaterials2Measurement.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQMaterials2MeasurementEdit:=TfrmRQMaterials2MeasurementEdit.Create(Application, dsView);
  try
    frmRQMaterials2MeasurementEdit.ShowModal;
  finally
    frmRQMaterials2MeasurementEdit.Free;
    frmRQMaterials2MeasurementEdit:=nil;
  end;
end;

procedure TfrmRQMaterials2MeasurementShow.actEditExecute(Sender: TObject);
Var TempRQMaterials2Measurement: RQMaterials2MeasurementControllerSoapPort;
begin
 TempRQMaterials2Measurement := HTTPRIORQMaterials2Measurement as RQMaterials2MeasurementControllerSoapPort;
   try
     RQMaterials2MeasurementObj := TempRQMaterials2Measurement.getObject(StrToInt(sgRQMaterials2Measurement.Cells[0,sgRQMaterials2Measurement.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQMaterials2MeasurementEdit:=TfrmRQMaterials2MeasurementEdit.Create(Application, dsEdit);
  try
    if frmRQMaterials2MeasurementEdit.ShowModal= mrOk then
      begin
        //TempRQMaterials2Measurement.save(RQMaterials2MeasurementObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQMaterials2MeasurementEdit.Free;
    frmRQMaterials2MeasurementEdit:=nil;
  end;
end;

procedure TfrmRQMaterials2MeasurementShow.actDeleteExecute(Sender: TObject);
Var TempRQMaterials2Measurement: RQMaterials2MeasurementControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQMaterials2Measurement := HTTPRIORQMaterials2Measurement as RQMaterials2MeasurementControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQMaterials2Measurement.Cells[0,sgRQMaterials2Measurement.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Додаткові одиниці виміру для матеріалу) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQMaterials2Measurement.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQMaterials2MeasurementShow.actInsertExecute(Sender: TObject);
Var TempRQMaterials2Measurement: RQMaterials2MeasurementControllerSoapPort;
begin
  TempRQMaterials2Measurement := HTTPRIORQMaterials2Measurement as RQMaterials2MeasurementControllerSoapPort;
  RQMaterials2MeasurementObj:=RQMaterials2Measurement.Create;

   RQMaterials2MeasurementObj.coef:= TXSDecimal.Create;


  try
    frmRQMaterials2MeasurementEdit:=TfrmRQMaterials2MeasurementEdit.Create(Application, dsInsert);
    try
      if frmRQMaterials2MeasurementEdit.ShowModal = mrOk then
      begin
        if RQMaterials2MeasurementObj<>nil then
            //TempRQMaterials2Measurement.add(RQMaterials2MeasurementObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQMaterials2MeasurementEdit.Free;
      frmRQMaterials2MeasurementEdit:=nil;
    end;
  finally
    RQMaterials2MeasurementObj.Free;
  end;
end;

procedure TfrmRQMaterials2MeasurementShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQMaterials2MeasurementShow.actFilterExecute(Sender: TObject);
begin
{frmRQMaterials2MeasurementFilterEdit:=TfrmRQMaterials2MeasurementFilterEdit.Create(Application, dsEdit);
  try
    RQMaterials2MeasurementFilterObj := RQMaterials2MeasurementFilter.Create;
    SetNullIntProps(RQMaterials2MeasurementFilterObj);
    SetNullXSProps(RQMaterials2MeasurementFilterObj);

    if frmRQMaterials2MeasurementFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQMaterials2MeasurementFilter.Create;
      FilterObject := RQMaterials2MeasurementFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQMaterials2MeasurementFilterEdit.Free;
    frmRQMaterials2MeasurementFilterEdit:=nil;
  end;}
end;

procedure TfrmRQMaterials2MeasurementShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.