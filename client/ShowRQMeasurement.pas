
unit ShowRQMeasurement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQMeasurementController, AdvObj ;


type
  TfrmRQMeasurementShow = class(TChildForm)  
  HTTPRIORQMeasurement: THTTPRIO;
    ImageList1: TImageList;
    sgRQMeasurement: TAdvStringGrid;
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
procedure sgRQMeasurementTopLeftChanged(Sender: TObject);
procedure sgRQMeasurementDblClick(Sender: TObject);
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
 frmRQMeasurementShow : TfrmRQMeasurementShow;
 // RQMeasurementObj: RQMeasurement;
 // RQMeasurementFilterObj: RQMeasurementFilter;
  
  
implementation

uses Main, EditRQMeasurement, EditRQMeasurementFilter;


{$R *.dfm}

var
  //frmRQMeasurementShow : TfrmRQMeasurementShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQMeasurementHeaders: array [1..4] of String =
        ( 'Код'
          ,'Наименование ед. изм.'
          ,'Наименование ед. изм. сокращенное'
          ,'код из ed_izm'
        );
   

procedure TfrmRQMeasurementShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQMeasurementShow:=nil;
    inherited;
  end;


procedure TfrmRQMeasurementShow.FormShow(Sender: TObject);
var
  TempRQMeasurement: RQMeasurementControllerSoapPort;
  i: Integer;
  RQMeasurementList: RQMeasurementShortList;
  begin
  SetGridHeaders(RQMeasurementHeaders, sgRQMeasurement.ColumnHeaders);
  ColCount:=100;
  TempRQMeasurement :=  HTTPRIORQMeasurement as RQMeasurementControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQMeasurementFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQMeasurementList := TempRQMeasurement.getScrollableFilteredList(RQMeasurementFilter(FilterObject),0,ColCount);


  LastCount:=High(RQMeasurementList.list);

  if LastCount > -1 then
     sgRQMeasurement.RowCount:=LastCount+2
  else
     sgRQMeasurement.RowCount:=2;

   with sgRQMeasurement do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQMeasurementList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQMeasurementList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQMeasurementList.list[i].name;
        Cells[2,i+1] := RQMeasurementList.list[i].shortName;
        if RQMeasurementList.list[i].outCode = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(RQMeasurementList.list[i].outCode);
        LastRow:=i+1;
        sgRQMeasurement.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQMeasurement.Row:=1;
end;

procedure TfrmRQMeasurementShow.sgRQMeasurementTopLeftChanged(Sender: TObject);
var
  TempRQMeasurement: RQMeasurementControllerSoapPort;
  i,CurrentRow: Integer;
  RQMeasurementList: RQMeasurementShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQMeasurement.TopRow + sgRQMeasurement.VisibleRowCount) = ColCount
  then
    begin
      TempRQMeasurement :=  HTTPRIORQMeasurement as RQMeasurementControllerSoapPort;
      CurrentRow:=sgRQMeasurement.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQMeasurementFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQMeasurementList := TempRQMeasurement.getScrollableFilteredList(RQMeasurementFilter(FilterObject),ColCount-1, 100);



  sgRQMeasurement.RowCount:=sgRQMeasurement.RowCount+100;
  LastCount:=High(RQMeasurementList.list);
  with sgRQMeasurement do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQMeasurementList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQMeasurementList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQMeasurementList.list[i].name;
        Cells[2,i+CurrentRow] := RQMeasurementList.list[i].shortName;
        if RQMeasurementList.list[i].outCode = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(RQMeasurementList.list[i].outCode);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQMeasurement.Row:=CurrentRow-5;
   sgRQMeasurement.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQMeasurementShow.sgRQMeasurementDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQMeasurement,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQMeasurementShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQMeasurement.RowCount-1 do
   for j:=0 to sgRQMeasurement.ColCount-1 do
     sgRQMeasurement.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQMeasurementShow.actViewExecute(Sender: TObject);
Var TempRQMeasurement: RQMeasurementControllerSoapPort;
begin
 TempRQMeasurement := HTTPRIORQMeasurement as RQMeasurementControllerSoapPort;
   try
     RQMeasurementObj := TempRQMeasurement.getObject(StrToInt(sgRQMeasurement.Cells[0,sgRQMeasurement.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQMeasurementEdit:=TfrmRQMeasurementEdit.Create(Application, dsView);
  try
    frmRQMeasurementEdit.ShowModal;
  finally
    frmRQMeasurementEdit.Free;
    frmRQMeasurementEdit:=nil;
  end;
end;

procedure TfrmRQMeasurementShow.actEditExecute(Sender: TObject);
Var TempRQMeasurement: RQMeasurementControllerSoapPort;
begin
 TempRQMeasurement := HTTPRIORQMeasurement as RQMeasurementControllerSoapPort;
   try
     RQMeasurementObj := TempRQMeasurement.getObject(StrToInt(sgRQMeasurement.Cells[0,sgRQMeasurement.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQMeasurementEdit:=TfrmRQMeasurementEdit.Create(Application, dsEdit);
  try
    if frmRQMeasurementEdit.ShowModal= mrOk then
      begin
        //TempRQMeasurement.save(RQMeasurementObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQMeasurementEdit.Free;
    frmRQMeasurementEdit:=nil;
  end;
end;

procedure TfrmRQMeasurementShow.actDeleteExecute(Sender: TObject);
Var TempRQMeasurement: RQMeasurementControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQMeasurement := HTTPRIORQMeasurement as RQMeasurementControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQMeasurement.Cells[0,sgRQMeasurement.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Справочник единиц измерений (Собств.Зак.)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQMeasurement.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQMeasurementShow.actInsertExecute(Sender: TObject);
Var TempRQMeasurement: RQMeasurementControllerSoapPort;
begin
  TempRQMeasurement := HTTPRIORQMeasurement as RQMeasurementControllerSoapPort;
  RQMeasurementObj:=RQMeasurement.Create;



  try
    frmRQMeasurementEdit:=TfrmRQMeasurementEdit.Create(Application, dsInsert);
    try
      if frmRQMeasurementEdit.ShowModal = mrOk then
      begin
        if RQMeasurementObj<>nil then
            //TempRQMeasurement.add(RQMeasurementObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQMeasurementEdit.Free;
      frmRQMeasurementEdit:=nil;
    end;
  finally
    RQMeasurementObj.Free;
  end;
end;

procedure TfrmRQMeasurementShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQMeasurementShow.actFilterExecute(Sender: TObject);
begin
{frmRQMeasurementFilterEdit:=TfrmRQMeasurementFilterEdit.Create(Application, dsEdit);
  try
    RQMeasurementFilterObj := RQMeasurementFilter.Create;
    SetNullIntProps(RQMeasurementFilterObj);
    SetNullXSProps(RQMeasurementFilterObj);

    if frmRQMeasurementFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQMeasurementFilter.Create;
      FilterObject := RQMeasurementFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQMeasurementFilterEdit.Free;
    frmRQMeasurementFilterEdit:=nil;
  end;}
end;

procedure TfrmRQMeasurementShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.