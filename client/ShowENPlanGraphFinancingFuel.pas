
unit ShowENPlanGraphFinancingFuel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanGraphFinancingFuelController, AdvObj ;


type
  TfrmENPlanGraphFinancingFuelShow = class(TChildForm)  
  HTTPRIOENPlanGraphFinancingFuel: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanGraphFinancingFuel: TAdvStringGrid;
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
    ToolButton4: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENPlanGraphFinancingFuelTopLeftChanged(Sender: TObject);
procedure sgENPlanGraphFinancingFuelDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENPlanGraphFinancingFuelObj: ENPlanGraphFinancingFuel;
 // ENPlanGraphFinancingFuelFilterObj: ENPlanGraphFinancingFuelFilter;
  
  
implementation

uses Main, EditENPlanGraphFinancingFuel{, EditENPlanGraphFinancingFuelFilter},
  GraphPlanningSpendingFuel;


{$R *.dfm}

var
  //frmENPlanGraphFinancingFuelShow : TfrmENPlanGraphFinancingFuelShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanGraphFinancingFuelHeaders: array [1..10] of String =
        ( 'Код'
          ,'Месяц финансирования'
          ,'Год финансирования'
          ,'Всього сумма з ПДВ, грн.'
          ,'Коэфициент по 1 декаде'
          ,'Коэфициент по 2 декаде'
          ,'Коэфициент по 3 декаде'
          ,'Тип палива'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENPlanGraphFinancingFuelShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanGraphFinancingFuelShow:=nil;
    inherited;
  end;


procedure TfrmENPlanGraphFinancingFuelShow.FormShow(Sender: TObject);
var
  TempENPlanGraphFinancingFuel: ENPlanGraphFinancingFuelControllerSoapPort;
  i: Integer;
  ENPlanGraphFinancingFuelList: ENPlanGraphFinancingFuelShortList;
  begin
  SetGridHeaders(ENPlanGraphFinancingFuelHeaders, sgENPlanGraphFinancingFuel.ColumnHeaders);
  ColCount:=100;
  TempENPlanGraphFinancingFuel :=  HTTPRIOENPlanGraphFinancingFuel as ENPlanGraphFinancingFuelControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanGraphFinancingFuelFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanGraphFinancingFuelList := TempENPlanGraphFinancingFuel.getScrollableFilteredList(ENPlanGraphFinancingFuelFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanGraphFinancingFuelList.list);

  if LastCount > -1 then
     sgENPlanGraphFinancingFuel.RowCount:=LastCount+2
  else
     sgENPlanGraphFinancingFuel.RowCount:=2;

   with sgENPlanGraphFinancingFuel do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanGraphFinancingFuelList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanGraphFinancingFuelList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENPlanGraphFinancingFuelList.list[i].monthGen = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENPlanGraphFinancingFuelList.list[i].monthGen);
        if ENPlanGraphFinancingFuelList.list[i].yearGen = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENPlanGraphFinancingFuelList.list[i].yearGen);
        if ENPlanGraphFinancingFuelList.list[i].totalSum = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENPlanGraphFinancingFuelList.list[i].totalSum.DecimalString;
        if ENPlanGraphFinancingFuelList.list[i].koefDekada1 = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENPlanGraphFinancingFuelList.list[i].koefDekada1.DecimalString;
        if ENPlanGraphFinancingFuelList.list[i].koefDekada2 = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENPlanGraphFinancingFuelList.list[i].koefDekada2.DecimalString;
        if ENPlanGraphFinancingFuelList.list[i].koefDekada3 = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENPlanGraphFinancingFuelList.list[i].koefDekada3.DecimalString;
		  
		Cells[7,i+1] := ENPlanGraphFinancingFuelList.list[i].fuelTypeRefName;

        Cells[8,i+1] := ENPlanGraphFinancingFuelList.list[i].userGen;
        if ENPlanGraphFinancingFuelList.list[i].dateEdit = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDateTimeWithDate2String(ENPlanGraphFinancingFuelList.list[i].dateEdit);

        LastRow:=i+1;
        sgENPlanGraphFinancingFuel.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanGraphFinancingFuel.Row:=1;
end;

procedure TfrmENPlanGraphFinancingFuelShow.sgENPlanGraphFinancingFuelTopLeftChanged(Sender: TObject);
var
  TempENPlanGraphFinancingFuel: ENPlanGraphFinancingFuelControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanGraphFinancingFuelList: ENPlanGraphFinancingFuelShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanGraphFinancingFuel.TopRow + sgENPlanGraphFinancingFuel.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanGraphFinancingFuel :=  HTTPRIOENPlanGraphFinancingFuel as ENPlanGraphFinancingFuelControllerSoapPort;
      CurrentRow:=sgENPlanGraphFinancingFuel.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanGraphFinancingFuelFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanGraphFinancingFuelList := TempENPlanGraphFinancingFuel.getScrollableFilteredList(ENPlanGraphFinancingFuelFilter(FilterObject),ColCount-1, 100);



  sgENPlanGraphFinancingFuel.RowCount:=sgENPlanGraphFinancingFuel.RowCount+100;
  LastCount:=High(ENPlanGraphFinancingFuelList.list);
  with sgENPlanGraphFinancingFuel do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanGraphFinancingFuelList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanGraphFinancingFuelList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENPlanGraphFinancingFuelList.list[i].monthGen = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(ENPlanGraphFinancingFuelList.list[i].monthGen);
        if ENPlanGraphFinancingFuelList.list[i].yearGen = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENPlanGraphFinancingFuelList.list[i].yearGen);
        if ENPlanGraphFinancingFuelList.list[i].totalSum = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENPlanGraphFinancingFuelList.list[i].totalSum.DecimalString;
        if ENPlanGraphFinancingFuelList.list[i].koefDekada1 = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENPlanGraphFinancingFuelList.list[i].koefDekada1.DecimalString;
        if ENPlanGraphFinancingFuelList.list[i].koefDekada2 = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENPlanGraphFinancingFuelList.list[i].koefDekada2.DecimalString;
        if ENPlanGraphFinancingFuelList.list[i].koefDekada3 = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENPlanGraphFinancingFuelList.list[i].koefDekada3.DecimalString;

		Cells[7,i+CurrentRow] := ENPlanGraphFinancingFuelList.list[i].fuelTypeRefName;
		  
        Cells[8,i+CurrentRow] := ENPlanGraphFinancingFuelList.list[i].userGen;
        if ENPlanGraphFinancingFuelList.list[i].dateEdit = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDateTimeWithDate2String(ENPlanGraphFinancingFuelList.list[i].dateEdit);		  


          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanGraphFinancingFuel.Row:=CurrentRow-5;
   sgENPlanGraphFinancingFuel.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanGraphFinancingFuelShow.ToolButton4Click(Sender: TObject);
begin

    frmGraphPlanningSpendingFuel := TfrmGraphPlanningSpendingFuel.Create(Application, dsInsert);
  try
    frmGraphPlanningSpendingFuel.ShowModal;
  finally
    frmGraphPlanningSpendingFuel.Free;
  end;

end;
procedure TfrmENPlanGraphFinancingFuelShow.sgENPlanGraphFinancingFuelDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanGraphFinancingFuel,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanGraphFinancingFuelShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanGraphFinancingFuel.RowCount-1 do
   for j:=0 to sgENPlanGraphFinancingFuel.ColCount-1 do
     sgENPlanGraphFinancingFuel.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanGraphFinancingFuelShow.actViewExecute(Sender: TObject);
Var TempENPlanGraphFinancingFuel: ENPlanGraphFinancingFuelControllerSoapPort;
begin
 TempENPlanGraphFinancingFuel := HTTPRIOENPlanGraphFinancingFuel as ENPlanGraphFinancingFuelControllerSoapPort;
   try
     ENPlanGraphFinancingFuelObj := TempENPlanGraphFinancingFuel.getObject(StrToInt(sgENPlanGraphFinancingFuel.Cells[0,sgENPlanGraphFinancingFuel.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanGraphFinancingFuelEdit:=TfrmENPlanGraphFinancingFuelEdit.Create(Application, dsView);
  try
    frmENPlanGraphFinancingFuelEdit.ShowModal;
  finally
    frmENPlanGraphFinancingFuelEdit.Free;
    frmENPlanGraphFinancingFuelEdit:=nil;
  end;
end;

procedure TfrmENPlanGraphFinancingFuelShow.actEditExecute(Sender: TObject);
Var TempENPlanGraphFinancingFuel: ENPlanGraphFinancingFuelControllerSoapPort;
begin
 TempENPlanGraphFinancingFuel := HTTPRIOENPlanGraphFinancingFuel as ENPlanGraphFinancingFuelControllerSoapPort;
   try
     ENPlanGraphFinancingFuelObj := TempENPlanGraphFinancingFuel.getObject(StrToInt(sgENPlanGraphFinancingFuel.Cells[0,sgENPlanGraphFinancingFuel.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanGraphFinancingFuelEdit:=TfrmENPlanGraphFinancingFuelEdit.Create(Application, dsEdit);
  try
    if frmENPlanGraphFinancingFuelEdit.ShowModal= mrOk then
      begin
        //TempENPlanGraphFinancingFuel.save(ENPlanGraphFinancingFuelObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanGraphFinancingFuelEdit.Free;
    frmENPlanGraphFinancingFuelEdit:=nil;
  end;
end;

procedure TfrmENPlanGraphFinancingFuelShow.actDeleteExecute(Sender: TObject);
Var TempENPlanGraphFinancingFuel: ENPlanGraphFinancingFuelControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanGraphFinancingFuel := HTTPRIOENPlanGraphFinancingFuel as ENPlanGraphFinancingFuelControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanGraphFinancingFuel.Cells[0,sgENPlanGraphFinancingFuel.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Плановый график финансирования по топливу) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanGraphFinancingFuel.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanGraphFinancingFuelShow.actInsertExecute(Sender: TObject);
// Var TempENPlanGraphFinancingFuel: ENPlanGraphFinancingFuelControllerSoapPort; 
begin
  // TempENPlanGraphFinancingFuel := HTTPRIOENPlanGraphFinancingFuel as ENPlanGraphFinancingFuelControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPlanGraphFinancingFuelObj:=ENPlanGraphFinancingFuel.Create;

   //ENPlanGraphFinancingFuelObj.totalSum:= TXSDecimal.Create;
   //ENPlanGraphFinancingFuelObj.koefDekada1:= TXSDecimal.Create;
   //ENPlanGraphFinancingFuelObj.koefDekada2:= TXSDecimal.Create;
   //ENPlanGraphFinancingFuelObj.koefDekada3:= TXSDecimal.Create;


  try
    frmENPlanGraphFinancingFuelEdit:=TfrmENPlanGraphFinancingFuelEdit.Create(Application, dsInsert);
    try
      if frmENPlanGraphFinancingFuelEdit.ShowModal = mrOk then
      begin
        if ENPlanGraphFinancingFuelObj<>nil then
            //TempENPlanGraphFinancingFuel.add(ENPlanGraphFinancingFuelObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanGraphFinancingFuelEdit.Free;
      frmENPlanGraphFinancingFuelEdit:=nil;
    end;
  finally
    ENPlanGraphFinancingFuelObj.Free;
  end;
end;

procedure TfrmENPlanGraphFinancingFuelShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanGraphFinancingFuelShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanGraphFinancingFuelFilterEdit:=TfrmENPlanGraphFinancingFuelFilterEdit.Create(Application, dsInsert);
  try
    ENPlanGraphFinancingFuelFilterObj := ENPlanGraphFinancingFuelFilter.Create;
    SetNullIntProps(ENPlanGraphFinancingFuelFilterObj);
    SetNullXSProps(ENPlanGraphFinancingFuelFilterObj);

    if frmENPlanGraphFinancingFuelFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPlanGraphFinancingFuelFilter.Create;
      FilterObject := ENPlanGraphFinancingFuelFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanGraphFinancingFuelFilterEdit.Free;
    frmENPlanGraphFinancingFuelFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanGraphFinancingFuelShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.