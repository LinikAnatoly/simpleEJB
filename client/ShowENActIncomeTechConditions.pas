
unit ShowENActIncomeTechConditions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENActIncomeTechConditionsController, AdvObj ;


type
  TfrmENActIncomeTechConditionsShow = class(TChildForm)  
  HTTPRIOENActIncomeTechConditions: THTTPRIO;
    ImageList1: TImageList;
    sgENActIncomeTechConditions: TAdvStringGrid;
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
procedure sgENActIncomeTechConditionsTopLeftChanged(Sender: TObject);
procedure sgENActIncomeTechConditionsDblClick(Sender: TObject);
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
 // ENActIncomeTechConditionsObj: ENActIncomeTechConditions;
 // ENActIncomeTechConditionsFilterObj: ENActIncomeTechConditionsFilter;
  
  
implementation

uses Main, EditENActIncomeTechConditions, EditENActIncomeTechConditionsFilter;


{$R *.dfm}

var
  //frmENActIncomeTechConditionsShow : TfrmENActIncomeTechConditionsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActIncomeTechConditionsHeaders: array [1..7] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
          ,'Дата початку акту'
          ,'Дата закінчення акту'
          ,'Загальна сумма'
          ,'Сума (ПДВ)'
        );
   

procedure TfrmENActIncomeTechConditionsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENActIncomeTechConditionsShow:=nil;
    inherited;
  end;


procedure TfrmENActIncomeTechConditionsShow.FormShow(Sender: TObject);
var
  TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
  i: Integer;
  ENActIncomeTechConditionsList: ENActIncomeTechConditionsShortList;
  begin
  SetGridHeaders(ENActIncomeTechConditionsHeaders, sgENActIncomeTechConditions.ColumnHeaders);
  ColCount:=100;
  TempENActIncomeTechConditions :=  HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActIncomeTechConditionsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActIncomeTechConditionsList := TempENActIncomeTechConditions.getScrollableFilteredList(ENActIncomeTechConditionsFilter(FilterObject),0,ColCount);


  LastCount:=High(ENActIncomeTechConditionsList.list);

  if LastCount > -1 then
     sgENActIncomeTechConditions.RowCount:=LastCount+2
  else
     sgENActIncomeTechConditions.RowCount:=2;

   with sgENActIncomeTechConditions do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActIncomeTechConditionsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActIncomeTechConditionsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActIncomeTechConditionsList.list[i].numbergen;
        if ENActIncomeTechConditionsList.list[i].dategen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENActIncomeTechConditionsList.list[i].dategen);
        if ENActIncomeTechConditionsList.list[i].actDateStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENActIncomeTechConditionsList.list[i].actDateStart);
        if ENActIncomeTechConditionsList.list[i].actDateEnd = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENActIncomeTechConditionsList.list[i].actDateEnd);
        if ENActIncomeTechConditionsList.list[i].summaGen = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENActIncomeTechConditionsList.list[i].summaGen.DecimalString;
        if ENActIncomeTechConditionsList.list[i].summaVat = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENActIncomeTechConditionsList.list[i].summaVat.DecimalString;
        LastRow:=i+1;
        sgENActIncomeTechConditions.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENActIncomeTechConditions.Row:=1;
end;

procedure TfrmENActIncomeTechConditionsShow.sgENActIncomeTechConditionsTopLeftChanged(Sender: TObject);
var
  TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
  i,CurrentRow: Integer;
  ENActIncomeTechConditionsList: ENActIncomeTechConditionsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActIncomeTechConditions.TopRow + sgENActIncomeTechConditions.VisibleRowCount) = ColCount
  then
    begin
      TempENActIncomeTechConditions :=  HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
      CurrentRow:=sgENActIncomeTechConditions.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActIncomeTechConditionsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActIncomeTechConditionsList := TempENActIncomeTechConditions.getScrollableFilteredList(ENActIncomeTechConditionsFilter(FilterObject),ColCount-1, 100);



  sgENActIncomeTechConditions.RowCount:=sgENActIncomeTechConditions.RowCount+100;
  LastCount:=High(ENActIncomeTechConditionsList.list);
  with sgENActIncomeTechConditions do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActIncomeTechConditionsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActIncomeTechConditionsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActIncomeTechConditionsList.list[i].numbergen;
        if ENActIncomeTechConditionsList.list[i].dategen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENActIncomeTechConditionsList.list[i].dategen);
        if ENActIncomeTechConditionsList.list[i].actDateStart = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENActIncomeTechConditionsList.list[i].actDateStart);
        if ENActIncomeTechConditionsList.list[i].actDateEnd = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENActIncomeTechConditionsList.list[i].actDateEnd);
        if ENActIncomeTechConditionsList.list[i].summaGen = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENActIncomeTechConditionsList.list[i].summaGen.DecimalString;
        if ENActIncomeTechConditionsList.list[i].summaVat = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENActIncomeTechConditionsList.list[i].summaVat.DecimalString;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActIncomeTechConditions.Row:=CurrentRow-5;
   sgENActIncomeTechConditions.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActIncomeTechConditionsShow.sgENActIncomeTechConditionsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActIncomeTechConditions,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENActIncomeTechConditionsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENActIncomeTechConditions.RowCount-1 do
   for j:=0 to sgENActIncomeTechConditions.ColCount-1 do
     sgENActIncomeTechConditions.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENActIncomeTechConditionsShow.actViewExecute(Sender: TObject);
Var TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
begin
  frmENActIncomeTechConditionsEdit := TfrmENActIncomeTechConditionsEdit.Create(Application, dsView);
  try
    TempENActIncomeTechConditions := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
    try
      frmENActIncomeTechConditionsEdit.ENActIncomeTechConditionsObj := TempENActIncomeTechConditions.getObject(StrToInt(sgENActIncomeTechConditions.Cells[0, sgENActIncomeTechConditions.Row]));
    except
      on EConvertError do Exit;
    end;
    frmENActIncomeTechConditionsEdit.ShowModal;
  finally
    frmENActIncomeTechConditionsEdit.Free;
    frmENActIncomeTechConditionsEdit := nil;
  end;
end;

procedure TfrmENActIncomeTechConditionsShow.actEditExecute(Sender: TObject);
Var TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
begin
  TempENActIncomeTechConditions := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
  frmENActIncomeTechConditionsEdit := TfrmENActIncomeTechConditionsEdit.Create(Application, dsEdit);
  try
    try
      frmENActIncomeTechConditionsEdit.ENActIncomeTechConditionsObj := TempENActIncomeTechConditions.getObject(StrToInt(sgENActIncomeTechConditions.Cells[0, sgENActIncomeTechConditions.Row]));
    except
      on EConvertError do Exit;
    end;
    if frmENActIncomeTechConditionsEdit.ShowModal = mrOk then
      begin
        //TempENActIncomeTechConditions.save(ENActIncomeTechConditionsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActIncomeTechConditionsEdit.Free;
    frmENActIncomeTechConditionsEdit:=nil;
  end;
end;

procedure TfrmENActIncomeTechConditionsShow.actDeleteExecute(Sender: TObject);
Var TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActIncomeTechConditions := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActIncomeTechConditions.Cells[0,sgENActIncomeTechConditions.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Прибутковий акт на договір про виконання ТУ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActIncomeTechConditions.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActIncomeTechConditionsShow.actInsertExecute(Sender: TObject);
begin
  frmENActIncomeTechConditionsEdit := TfrmENActIncomeTechConditionsEdit.Create(Application, dsInsert);
  try
    frmENActIncomeTechConditionsEdit.ENActIncomeTechConditionsObj := ENActIncomeTechConditions.Create;
    if frmENActIncomeTechConditionsEdit.ShowModal = mrOk then
    begin
      if frmENActIncomeTechConditionsEdit.ENActIncomeTechConditionsObj <> nil then
        //TempENActIncomeTechConditions.add(ENActIncomeTechConditionsObj);
        UpdateGrid(Sender);
    end;
  finally
    frmENActIncomeTechConditionsEdit.Free;
    frmENActIncomeTechConditionsEdit := nil;
  end;
end;

procedure TfrmENActIncomeTechConditionsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENActIncomeTechConditionsShow.actFilterExecute(Sender: TObject);
begin
{frmENActIncomeTechConditionsFilterEdit:=TfrmENActIncomeTechConditionsFilterEdit.Create(Application, dsInsert);
  try
    ENActIncomeTechConditionsFilterObj := ENActIncomeTechConditionsFilter.Create;
    SetNullIntProps(ENActIncomeTechConditionsFilterObj);
    SetNullXSProps(ENActIncomeTechConditionsFilterObj);

    if frmENActIncomeTechConditionsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENActIncomeTechConditionsFilter.Create;
      FilterObject := ENActIncomeTechConditionsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActIncomeTechConditionsFilterEdit.Free;
    frmENActIncomeTechConditionsFilterEdit:=nil;
  end;}
end;

procedure TfrmENActIncomeTechConditionsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.