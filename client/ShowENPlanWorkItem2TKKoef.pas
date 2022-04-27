
unit ShowENPlanWorkItem2TKKoef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkItem2TKKoefController, AdvObj ;


type
  TfrmENPlanWorkItem2TKKoefShow = class(TChildForm)  
  HTTPRIOENPlanWorkItem2TKKoef: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWorkItem2TKKoef: TAdvStringGrid;
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
procedure sgENPlanWorkItem2TKKoefTopLeftChanged(Sender: TObject);
procedure sgENPlanWorkItem2TKKoefDblClick(Sender: TObject);
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
   techCardSource : Integer;
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENPlanWorkItem2TKKoefShow : TfrmENPlanWorkItem2TKKoefShow;
 // ENPlanWorkItem2TKKoefObj: ENPlanWorkItem2TKKoef;
 // ENPlanWorkItem2TKKoefFilterObj: ENPlanWorkItem2TKKoefFilter;
  
  
implementation

uses Main, EditENPlanWorkItem2TKKoef, EditENPlanWorkItem2TKKoefFilter,
  ENPlanWorkItemController, ENConsts;


{$R *.dfm}

var
  //frmENPlanWorkItem2TKKoefShow : TfrmENPlanWorkItem2TKKoefShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkItem2TKKoefHeaders: array [1..4] of String =
        ( 'Код'
        , 'Номер коеф.'
        , 'Назва коеф.'
        , 'Коеф.'
        );
   

procedure TfrmENPlanWorkItem2TKKoefShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWorkItem2TKKoefShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkItem2TKKoefShow.FormShow(Sender: TObject);
var
  TempENPlanWorkItem2TKKoef: ENPlanWorkItem2TKKoefControllerSoapPort;
  i: Integer;
  ENPlanWorkItem2TKKoefList: ENPlanWorkItem2TKKoefShortList;
  begin
  SetGridHeaders(ENPlanWorkItem2TKKoefHeaders, sgENPlanWorkItem2TKKoef.ColumnHeaders);
  ColCount:=100;
  TempENPlanWorkItem2TKKoef :=  HTTPRIOENPlanWorkItem2TKKoef as ENPlanWorkItem2TKKoefControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkItem2TKKoefFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkItem2TKKoefList := TempENPlanWorkItem2TKKoef.getScrollableFilteredList(ENPlanWorkItem2TKKoefFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanWorkItem2TKKoefList.list);

  if LastCount > -1 then
     sgENPlanWorkItem2TKKoef.RowCount:=LastCount+2
  else
     sgENPlanWorkItem2TKKoef.RowCount:=2;

   with sgENPlanWorkItem2TKKoef do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkItem2TKKoefList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWorkItem2TKKoefList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENPlanWorkItem2TKKoefList.list[i].sourceKoefNum;
        Cells[2,i+1] := ENPlanWorkItem2TKKoefList.list[i].sourceKoefName;

        if ENPlanWorkItem2TKKoefList.list[i].sourceKoefKoef <> nil then
           Cells[3,i+1] := ENPlanWorkItem2TKKoefList.list[i].sourceKoefKoef.DecimalString
        else
           Cells[3,i+1] := '';

        LastRow:=i+1;
        sgENPlanWorkItem2TKKoef.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanWorkItem2TKKoef.Row:=1;
end;

procedure TfrmENPlanWorkItem2TKKoefShow.sgENPlanWorkItem2TKKoefTopLeftChanged(Sender: TObject);
var
  TempENPlanWorkItem2TKKoef: ENPlanWorkItem2TKKoefControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanWorkItem2TKKoefList: ENPlanWorkItem2TKKoefShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanWorkItem2TKKoef.TopRow + sgENPlanWorkItem2TKKoef.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWorkItem2TKKoef :=  HTTPRIOENPlanWorkItem2TKKoef as ENPlanWorkItem2TKKoefControllerSoapPort;
      CurrentRow:=sgENPlanWorkItem2TKKoef.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkItem2TKKoefFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkItem2TKKoefList := TempENPlanWorkItem2TKKoef.getScrollableFilteredList(ENPlanWorkItem2TKKoefFilter(FilterObject),ColCount-1, 100);



  sgENPlanWorkItem2TKKoef.RowCount:=sgENPlanWorkItem2TKKoef.RowCount+100;
  LastCount:=High(ENPlanWorkItem2TKKoefList.list);
  with sgENPlanWorkItem2TKKoef do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkItem2TKKoefList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanWorkItem2TKKoefList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanWorkItem2TKKoef.Row:=CurrentRow-5;
   sgENPlanWorkItem2TKKoef.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanWorkItem2TKKoefShow.sgENPlanWorkItem2TKKoefDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanWorkItem2TKKoef,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanWorkItem2TKKoefShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWorkItem2TKKoef.RowCount-1 do
   for j:=0 to sgENPlanWorkItem2TKKoef.ColCount-1 do
     sgENPlanWorkItem2TKKoef.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanWorkItem2TKKoefShow.actViewExecute(Sender: TObject);
Var TempENPlanWorkItem2TKKoef: ENPlanWorkItem2TKKoefControllerSoapPort;
begin
 TempENPlanWorkItem2TKKoef := HTTPRIOENPlanWorkItem2TKKoef as ENPlanWorkItem2TKKoefControllerSoapPort;
   try
     ENPlanWorkItem2TKKoefObj := TempENPlanWorkItem2TKKoef.getObject(StrToInt(sgENPlanWorkItem2TKKoef.Cells[0,sgENPlanWorkItem2TKKoef.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkItem2TKKoefEdit:=TfrmENPlanWorkItem2TKKoefEdit.Create(Application, dsView);
  try
    frmENPlanWorkItem2TKKoefEdit.ShowModal;
  finally
    frmENPlanWorkItem2TKKoefEdit.Free;
    frmENPlanWorkItem2TKKoefEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkItem2TKKoefShow.actEditExecute(Sender: TObject);
Var TempENPlanWorkItem2TKKoef: ENPlanWorkItem2TKKoefControllerSoapPort;
begin
 TempENPlanWorkItem2TKKoef := HTTPRIOENPlanWorkItem2TKKoef as ENPlanWorkItem2TKKoefControllerSoapPort;
   try
     ENPlanWorkItem2TKKoefObj := TempENPlanWorkItem2TKKoef.getObject(StrToInt(sgENPlanWorkItem2TKKoef.Cells[0,sgENPlanWorkItem2TKKoef.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkItem2TKKoefEdit:=TfrmENPlanWorkItem2TKKoefEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkItem2TKKoefEdit.ShowModal= mrOk then
      begin
        //TempENPlanWorkItem2TKKoef.save(ENPlanWorkItem2TKKoefObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWorkItem2TKKoefEdit.Free;
    frmENPlanWorkItem2TKKoefEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkItem2TKKoefShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkItem2TKKoef: ENPlanWorkItem2TKKoefControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanWorkItem2TKKoef := HTTPRIOENPlanWorkItem2TKKoef as ENPlanWorkItem2TKKoefControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanWorkItem2TKKoef.Cells[0,sgENPlanWorkItem2TKKoef.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (коєф. для робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanWorkItem2TKKoef.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkItem2TKKoefShow.actInsertExecute(Sender: TObject);
Var TempENPlanWorkItem2TKKoef: ENPlanWorkItem2TKKoefControllerSoapPort;
    pwRefCode : Integer;
begin


  pwRefCode := LOW_INT;

  if (FilterObject <> nil) then
  if ENPlanWorkItem2TKKoefFilter(FilterObject).planWorkItemRef <> nil then
  if ENPlanWorkItem2TKKoefFilter(FilterObject).planWorkItemRef.code > LOW_INT then
     pwRefCode := ENPlanWorkItem2TKKoefFilter(FilterObject).planWorkItemRef.code;

  if pwRefCode = LOW_INT then
  begin
   ShowMessage('Не выбрана работа ...');
   exit;
  end;

  TempENPlanWorkItem2TKKoef := HTTPRIOENPlanWorkItem2TKKoef as ENPlanWorkItem2TKKoefControllerSoapPort;
  ENPlanWorkItem2TKKoefObj:=ENPlanWorkItem2TKKoef.Create;
  ENPlanWorkItem2TKKoefObj.planWorkItemRef := ENPlanWorkItemRef.Create;

  ENPlanWorkItem2TKKoefObj.planWorkItemRef.code := pwRefCode;


  try
    frmENPlanWorkItem2TKKoefEdit:=TfrmENPlanWorkItem2TKKoefEdit.Create(Application, dsInsert);
    frmENPlanWorkItem2TKKoefEdit.techCardSource := techCardSource;
    try
      if frmENPlanWorkItem2TKKoefEdit.ShowModal = mrOk then
      begin
        if ENPlanWorkItem2TKKoefObj<>nil then
            //TempENPlanWorkItem2TKKoef.add(ENPlanWorkItem2TKKoefObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkItem2TKKoefEdit.Free;
      frmENPlanWorkItem2TKKoefEdit:=nil;
    end;
  finally
    ENPlanWorkItem2TKKoefObj.Free;
  end;
end;

procedure TfrmENPlanWorkItem2TKKoefShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanWorkItem2TKKoefShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanWorkItem2TKKoefFilterEdit:=TfrmENPlanWorkItem2TKKoefFilterEdit.Create(Application, dsEdit);
  try
    ENPlanWorkItem2TKKoefFilterObj := ENPlanWorkItem2TKKoefFilter.Create;
    SetNullIntProps(ENPlanWorkItem2TKKoefFilterObj);
    SetNullXSProps(ENPlanWorkItem2TKKoefFilterObj);

    if frmENPlanWorkItem2TKKoefFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPlanWorkItem2TKKoefFilter.Create;
      FilterObject := ENPlanWorkItem2TKKoefFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkItem2TKKoefFilterEdit.Free;
    frmENPlanWorkItem2TKKoefFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanWorkItem2TKKoefShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.