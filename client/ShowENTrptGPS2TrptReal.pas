
unit ShowENTrptGPS2TrptReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTrptGPS2TrptRealController ;


type
  TfrmENTrptGPS2TrptRealShow = class(TChildForm)  
  HTTPRIOENTrptGPS2TrptReal: THTTPRIO;
    ImageList1: TImageList;
    sgENTrptGPS2TrptReal: TAdvStringGrid;
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
procedure sgENTrptGPS2TrptRealTopLeftChanged(Sender: TObject);
procedure sgENTrptGPS2TrptRealDblClick(Sender: TObject);
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
 // ENTrptGPS2TrptRealObj: ENTrptGPS2TrptReal;
 // ENTrptGPS2TrptRealFilterObj: ENTrptGPS2TrptRealFilter;
  
  
implementation

uses Main, EditENTrptGPS2TrptReal, EditENTrptGPS2TrptRealFilter ;


{$R *.dfm}

var
  frmENTrptGPS2TrptRealShow : TfrmENTrptGPS2TrptRealShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTrptGPS2TrptRealHeaders: array [1..3] of String =
        (  'Код'
          ,'Транспорт предприятия'
          ,'Код транспорта по программе GPS'
        );
   

procedure TfrmENTrptGPS2TrptRealShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
     begin
      frmENTrptGPS2TrptRealEdit.Free;
      frmENTrptGPS2TrptRealShow:=nil;

     end;

    inherited;
  end;


procedure TfrmENTrptGPS2TrptRealShow.FormShow(Sender: TObject);
var
  TempENTrptGPS2TrptReal: ENTrptGPS2TrptRealControllerSoapPort;
  i: Integer;
  ENTrptGPS2TrptRealList: ENTrptGPS2TrptRealShortList;
  begin
  SetGridHeaders(ENTrptGPS2TrptRealHeaders, sgENTrptGPS2TrptReal.ColumnHeaders);
  ColCount:=100;
  TempENTrptGPS2TrptReal :=  HTTPRIOENTrptGPS2TrptReal as ENTrptGPS2TrptRealControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTrptGPS2TrptRealFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTrptGPS2TrptRealList := TempENTrptGPS2TrptReal.getScrollableFilteredList(ENTrptGPS2TrptRealFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTrptGPS2TrptRealList.list);

  if LastCount > -1 then
     sgENTrptGPS2TrptReal.RowCount:=LastCount+2
  else
     sgENTrptGPS2TrptReal.RowCount:=2;

   with sgENTrptGPS2TrptReal do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTrptGPS2TrptRealList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTrptGPS2TrptRealList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTrptGPS2TrptRealList.list[i].realTransportName + ' (' + ENTrptGPS2TrptRealList.list[i].realTransportGosNumber + ')'  ;
        Cells[2,i+1] := ENTrptGPS2TrptRealList.list[i].codeTranpostGps;
        LastRow:=i+1;
        sgENTrptGPS2TrptReal.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTrptGPS2TrptReal.Row:=1;
end;

procedure TfrmENTrptGPS2TrptRealShow.sgENTrptGPS2TrptRealTopLeftChanged(Sender: TObject);
var
  TempENTrptGPS2TrptReal: ENTrptGPS2TrptRealControllerSoapPort;
  i,CurrentRow: Integer;
  ENTrptGPS2TrptRealList: ENTrptGPS2TrptRealShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTrptGPS2TrptReal.TopRow + sgENTrptGPS2TrptReal.VisibleRowCount) = ColCount
  then
    begin
      TempENTrptGPS2TrptReal :=  HTTPRIOENTrptGPS2TrptReal as ENTrptGPS2TrptRealControllerSoapPort;
      CurrentRow:=sgENTrptGPS2TrptReal.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTrptGPS2TrptRealFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTrptGPS2TrptRealList := TempENTrptGPS2TrptReal.getScrollableFilteredList(ENTrptGPS2TrptRealFilter(FilterObject),ColCount-1, 100);



  sgENTrptGPS2TrptReal.RowCount:=sgENTrptGPS2TrptReal.RowCount+100;
  LastCount:=High(ENTrptGPS2TrptRealList.list);
  with sgENTrptGPS2TrptReal do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTrptGPS2TrptRealList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTrptGPS2TrptRealList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+1] := ENTrptGPS2TrptRealList.list[i].realTransportName + ' (' + ENTrptGPS2TrptRealList.list[i].realTransportGosNumber + ')'  ;
        Cells[2,i+CurrentRow] := ENTrptGPS2TrptRealList.list[i].codeTranpostGps;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTrptGPS2TrptReal.Row:=CurrentRow-5;
   sgENTrptGPS2TrptReal.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTrptGPS2TrptRealShow.sgENTrptGPS2TrptRealDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTrptGPS2TrptReal,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTrptGPS2TrptRealShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTrptGPS2TrptReal.RowCount-1 do
   for j:=0 to sgENTrptGPS2TrptReal.ColCount-1 do
     sgENTrptGPS2TrptReal.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTrptGPS2TrptRealShow.actViewExecute(Sender: TObject);
Var TempENTrptGPS2TrptReal: ENTrptGPS2TrptRealControllerSoapPort;
begin
 TempENTrptGPS2TrptReal := HTTPRIOENTrptGPS2TrptReal as ENTrptGPS2TrptRealControllerSoapPort;
   try
     ENTrptGPS2TrptRealObj := TempENTrptGPS2TrptReal.getObject(StrToInt(sgENTrptGPS2TrptReal.Cells[0,sgENTrptGPS2TrptReal.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTrptGPS2TrptRealEdit:=TfrmENTrptGPS2TrptRealEdit.Create(Application, dsView);
  try
    frmENTrptGPS2TrptRealEdit.ShowModal;
  finally
    frmENTrptGPS2TrptRealEdit.Free;
    frmENTrptGPS2TrptRealEdit:=nil;
  end;
end;

procedure TfrmENTrptGPS2TrptRealShow.actEditExecute(Sender: TObject);
Var TempENTrptGPS2TrptReal: ENTrptGPS2TrptRealControllerSoapPort;
begin
 TempENTrptGPS2TrptReal := HTTPRIOENTrptGPS2TrptReal as ENTrptGPS2TrptRealControllerSoapPort;
   try
     ENTrptGPS2TrptRealObj := TempENTrptGPS2TrptReal.getObject(StrToInt(sgENTrptGPS2TrptReal.Cells[0,sgENTrptGPS2TrptReal.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTrptGPS2TrptRealEdit:=TfrmENTrptGPS2TrptRealEdit.Create(Application, dsEdit);
  try
    if frmENTrptGPS2TrptRealEdit.ShowModal= mrOk then
      begin
        //TempENTrptGPS2TrptReal.save(ENTrptGPS2TrptRealObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTrptGPS2TrptRealEdit.Free;
    frmENTrptGPS2TrptRealEdit:=nil;
  end;
end;

procedure TfrmENTrptGPS2TrptRealShow.actDeleteExecute(Sender: TObject);
Var TempENTrptGPS2TrptReal: ENTrptGPS2TrptRealControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTrptGPS2TrptReal := HTTPRIOENTrptGPS2TrptReal as ENTrptGPS2TrptRealControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTrptGPS2TrptReal.Cells[0,sgENTrptGPS2TrptReal.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связка реального транспорта тех карт с транспортом с программы GPS) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTrptGPS2TrptReal.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTrptGPS2TrptRealShow.actInsertExecute(Sender: TObject);
Var TempENTrptGPS2TrptReal: ENTrptGPS2TrptRealControllerSoapPort;
begin
  TempENTrptGPS2TrptReal := HTTPRIOENTrptGPS2TrptReal as ENTrptGPS2TrptRealControllerSoapPort;
  ENTrptGPS2TrptRealObj:=ENTrptGPS2TrptReal.Create;



  try
    frmENTrptGPS2TrptRealEdit:=TfrmENTrptGPS2TrptRealEdit.Create(Application, dsInsert);
    try
      if frmENTrptGPS2TrptRealEdit.ShowModal = mrOk then
      begin
        if ENTrptGPS2TrptRealObj<>nil then
            //TempENTrptGPS2TrptReal.add(ENTrptGPS2TrptRealObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTrptGPS2TrptRealEdit.Free;
      frmENTrptGPS2TrptRealEdit:=nil;
    end;
  finally
    ENTrptGPS2TrptRealObj.Free;
  end;
end;

procedure TfrmENTrptGPS2TrptRealShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTrptGPS2TrptRealShow.actFilterExecute(Sender: TObject);
begin
{frmENTrptGPS2TrptRealFilterEdit:=TfrmENTrptGPS2TrptRealFilterEdit.Create(Application, dsInsert);
  try
    ENTrptGPS2TrptRealFilterObj := ENTrptGPS2TrptRealFilter.Create;
    SetNullIntProps(ENTrptGPS2TrptRealFilterObj);
    SetNullXSProps(ENTrptGPS2TrptRealFilterObj);

    if frmENTrptGPS2TrptRealFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTrptGPS2TrptRealFilter.Create;
      FilterObject := ENTrptGPS2TrptRealFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTrptGPS2TrptRealFilterEdit.Free;
    frmENTrptGPS2TrptRealFilterEdit:=nil;
  end;}
end;

procedure TfrmENTrptGPS2TrptRealShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.