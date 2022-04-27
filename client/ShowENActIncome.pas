
unit ShowENActIncome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENActIncomeController, AdvObj ;


type
  TfrmENActIncomeShow = class(TChildForm)  
  HTTPRIOENActIncome: THTTPRIO;
    ImageList1: TImageList;
    sgENActIncome: TAdvStringGrid;
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
procedure sgENActIncomeTopLeftChanged(Sender: TObject);
procedure sgENActIncomeDblClick(Sender: TObject);
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
 // ENActIncomeObj: ENActIncome;
 // ENActIncomeFilterObj: ENActIncomeFilter;
  
  
implementation

uses Main, EditENActIncome, EditENActIncomeFilter, ENConsts;


{$R *.dfm}

var
  //frmENActIncomeShow : TfrmENActIncomeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActIncomeHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
          ,'Дата початку акту'
          ,'Дата закінчення акту'
          ,'Номер договору'
          ,'Дата договору'
          ,'Найменування організації'
          ,'статус акту'
          //,'код договору у фін.кол.'
          //,'PK договору у фін.кол.'
        );
   

procedure TfrmENActIncomeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENActIncomeShow:=nil;
    inherited;
  end;


procedure TfrmENActIncomeShow.FormShow(Sender: TObject);
var
  TempENActIncome: ENActIncomeControllerSoapPort;
  i: Integer;
  ENActIncomeList: ENActIncomeShortList;
  begin
  SetGridHeaders(ENActIncomeHeaders, sgENActIncome.ColumnHeaders);
  ColCount:=100;
  TempENActIncome :=  HTTPRIOENActIncome as ENActIncomeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActIncomeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if Length(ENActIncomeFilter(FilterObject).orderBySQL) = 0 then begin
    ENActIncomeFilter(FilterObject).orderBySQL := 'dategen desc';
  end;

  ENActIncomeList := TempENActIncome.getScrollableFilteredList(ENActIncomeFilter(FilterObject),0,ColCount);

  LastCount := High(ENActIncomeList.list);

  if LastCount > -1 then
     sgENActIncome.RowCount:=LastCount+2
  else
     sgENActIncome.RowCount:=2;

   with sgENActIncome do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActIncomeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActIncomeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActIncomeList.list[i].numbergen;
        if ENActIncomeList.list[i].dategen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENActIncomeList.list[i].dategen);

        if ENActIncomeList.list[i].actDateStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENActIncomeList.list[i].actDateStart);

        if ENActIncomeList.list[i].actDateEnd = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENActIncomeList.list[i].actDateEnd);

        Cells[5,i+1] := ENActIncomeList.list[i].contractNumber;

        if ENActIncomeList.list[i].contractDate = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENActIncomeList.list[i].contractDate);

        Cells[7,i+1] := ENActIncomeList.list[i].partnername;
        Cells[8,i+1] := ENActIncomeList.list[i].statusRefName;

        LastRow := i + 1;
        sgENActIncome.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENActIncome.Row:=1;
end;

procedure TfrmENActIncomeShow.sgENActIncomeTopLeftChanged(Sender: TObject);
var
  TempENActIncome: ENActIncomeControllerSoapPort;
  i,CurrentRow: Integer;
  ENActIncomeList: ENActIncomeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActIncome.TopRow + sgENActIncome.VisibleRowCount) = ColCount
  then
    begin
      TempENActIncome :=  HTTPRIOENActIncome as ENActIncomeControllerSoapPort;
      CurrentRow:=sgENActIncome.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActIncomeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if Length(ENActIncomeFilter(FilterObject).orderBySQL) = 0 then begin
    ENActIncomeFilter(FilterObject).orderBySQL := 'dategen desc';
  end;

  ENActIncomeList := TempENActIncome.getScrollableFilteredList(ENActIncomeFilter(FilterObject),ColCount-1, 100);

  sgENActIncome.RowCount :=  sgENActIncome.RowCount+100;
  LastCount:=High(ENActIncomeList.list);
  with sgENActIncome do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActIncomeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActIncomeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActIncomeList.list[i].numbergen;
        if ENActIncomeList.list[i].dategen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENActIncomeList.list[i].dategen);
        if ENActIncomeList.list[i].actDateStart = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENActIncomeList.list[i].actDateStart);
        if ENActIncomeList.list[i].actDateEnd = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENActIncomeList.list[i].actDateEnd);
        Cells[5,i+CurrentRow] := ENActIncomeList.list[i].contractNumber;
        if ENActIncomeList.list[i].contractDate = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDate2String(ENActIncomeList.list[i].contractDate);
        Cells[7,i+CurrentRow] := ENActIncomeList.list[i].partnername;
        Cells[8,i+CurrentRow] := ENActIncomeList.list[i].statusRefName;

        LastRow := i + CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActIncome.Row:=CurrentRow-5;
   sgENActIncome.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActIncomeShow.sgENActIncomeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActIncome,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENActIncomeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENActIncome.RowCount-1 do
   for j:=0 to sgENActIncome.ColCount-1 do
     sgENActIncome.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENActIncomeShow.actViewExecute(Sender: TObject);
Var TempENActIncome: ENActIncomeControllerSoapPort;
begin
 TempENActIncome := HTTPRIOENActIncome as ENActIncomeControllerSoapPort;
   try
     ENActIncomeObj := TempENActIncome.getObject(StrToInt(sgENActIncome.Cells[0,sgENActIncome.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENActIncomeEdit:=TfrmENActIncomeEdit.Create(Application, dsView);
  try

    if frmENActIncomeEdit.ShowModal in [mrOk, mrYes] then
      begin
        UpdateGrid(Sender);
      end;

  finally
    frmENActIncomeEdit.Free;
    frmENActIncomeEdit:=nil;
  end;
end;

procedure TfrmENActIncomeShow.actEditExecute(Sender: TObject);
Var TempENActIncome: ENActIncomeControllerSoapPort;
begin
 TempENActIncome := HTTPRIOENActIncome as ENActIncomeControllerSoapPort;
   try
     ENActIncomeObj := TempENActIncome.getObject(StrToInt(sgENActIncome.Cells[0,sgENActIncome.Row]));
   except
   on EConvertError do Exit;
  end;

  if (ENActIncomeObj.statusRef.code = ENACT_CLOSED) then
  begin
    Application.MessageBox(PChar('Договори, проведені в ФК, редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  frmENActIncomeEdit:=TfrmENActIncomeEdit.Create(Application, dsEdit);
  try
    if frmENActIncomeEdit.ShowModal in [mrOk, mrYes] then
      begin
        UpdateGrid(Sender);
      end;
  finally
    frmENActIncomeEdit.Free;
    frmENActIncomeEdit:=nil;
  end;
end;

procedure TfrmENActIncomeShow.actDeleteExecute(Sender: TObject);
var TempENActIncome : ENActIncomeControllerSoapPort;
    ObjCode : Integer;
    ENActIncomeObj : ENActIncome;
begin
   TempENActIncome := HTTPRIOENActIncome as ENActIncomeControllerSoapPort;
    try
      ObjCode := StrToInt(sgENActIncome.Cells[0, sgENActIncome.Row]);
    except
     on EConvertError do Exit;
    end;

    if Application.MessageBox(PChar('Вы действительно хотите удалить (Доходный Акт) ?'),
                      PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
        ENActIncomeObj := TempENActIncome.getObject(ObjCode);
        if (ENActIncomeObj <> nil) then
        begin
          if (ENActIncomeObj.statusRef.code <> ENACT_GOOD) then
          begin
            Application.MessageBox(PChar('Акт вже проведений ... !!!'), PChar('Внимание !'),MB_ICONWARNING);
            exit;
          end;
        end
        else
        begin
            Application.MessageBox(PChar('Акт НЕ знайдено ...'), PChar('Внимание !'),MB_ICONWARNING);
            exit;
        end;

        TempENActIncome.remove(ObjCode);
        UpdateGrid(Sender);
    end;
end;


procedure TfrmENActIncomeShow.actInsertExecute(Sender: TObject);
Var TempENActIncome: ENActIncomeControllerSoapPort;
begin
  TempENActIncome := HTTPRIOENActIncome as ENActIncomeControllerSoapPort;
  ENActIncomeObj:=ENActIncome.Create;

   //ENActIncomeObj.dategen:= TXSDate.Create;
   //ENActIncomeObj.actDateStart:= TXSDate.Create;
   //ENActIncomeObj.actDadeEnd:= TXSDate.Create;
   //ENActIncomeObj.contractDate:= TXSDate.Create;


  try
    frmENActIncomeEdit:=TfrmENActIncomeEdit.Create(Application, dsInsert);
    try
      if frmENActIncomeEdit.ShowModal = mrOk then
      begin
        if ENActIncomeObj<>nil then
            //TempENActIncome.add(ENActIncomeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENActIncomeEdit.Free;
      frmENActIncomeEdit:=nil;
    end;
  finally
    ENActIncomeObj.Free;
  end;
end;

procedure TfrmENActIncomeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENActIncomeShow.actFilterExecute(Sender: TObject);
begin
frmENActIncomeFilterEdit:=TfrmENActIncomeFilterEdit.Create(Application, dsInsert);
  try
    ENActIncomeFilterObj := ENActIncomeFilter.Create;
    SetNullIntProps(ENActIncomeFilterObj);
    SetNullXSProps(ENActIncomeFilterObj);

    if frmENActIncomeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENActIncomeFilter.Create;
      FilterObject := ENActIncomeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActIncomeFilterEdit.Free;
    frmENActIncomeFilterEdit:=nil;
  end;
end;

procedure TfrmENActIncomeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.