
unit ShowENFiderGuage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENFiderGuageController, AdvObj ;


type
  TfrmENFiderGuageShow = class(TChildForm)  
  HTTPRIOENFiderGuage: THTTPRIO;
    ImageList1: TImageList;
    sgENFiderGuage: TAdvStringGrid;
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
procedure sgENFiderGuageTopLeftChanged(Sender: TObject);
procedure sgENFiderGuageDblClick(Sender: TObject);
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
 frmENFiderGuageShow : TfrmENFiderGuageShow;
 // ENFiderGuageObj: ENFiderGuage;
 // ENFiderGuageFilterObj: ENFiderGuageFilter;
  
  
implementation

uses Main, EditENFiderGuage, EditENFiderGuageFilter;


{$R *.dfm}

var
  //frmENFiderGuageShow : TfrmENFiderGuageShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFiderGuageHeaders: array [1..12] of String =
        ( 'Код'
          ,'Дата замера'
          ,'№ присоединения'
          ,'Ток жёлтой фазы, А'
          ,'Ток зелёной фазы, А'
          ,'Ток красной фазы, А'
          ,'Напряжение жёлтой фазы, кВ'
          ,'Напряжение зелёной фазы, кВ'
          ,'Напряжение красной фазы, кВ'
          ,'Подстанция замера'
          ,'Трансформатор замера'
          ,'ФИО сотрудника, производившего замеры'
        );
   

procedure TfrmENFiderGuageShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFiderGuageShow:=nil;
    inherited;
  end;


procedure TfrmENFiderGuageShow.FormShow(Sender: TObject);
var TempENFiderGuage: ENFiderGuageControllerSoapPort;
  ENFiderGuageList: ENFiderGuageShortList;
  i: Integer;
begin
  SetGridHeaders(ENFiderGuageHeaders, sgENFiderGuage.ColumnHeaders);
  ColCount:=100;
  TempENFiderGuage :=  HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENFiderGuageFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENFiderGuageList := TempENFiderGuage.getScrollableFilteredList(
    ENFiderGuageFilter(FilterObject), 0, ColCount);

  LastCount := High(ENFiderGuageList.list);

  if LastCount > -1 then
    sgENFiderGuage.RowCount := LastCount + 2
  else
    sgENFiderGuage.RowCount := 2;

  with sgENFiderGuage do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFiderGuageList.list[i].code <> Low(Integer) then //Код
          Cells[0, i + 1] := IntToStr(ENFiderGuageList.list[i].code)
        else
          Cells[0, i + 1] := '';

        if ENFiderGuageList.list[i].dateGuage = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDateTimeOnlyDate2String(ENFiderGuageList.list[i].dateGuage);

        Cells[2, i + 1] := ENFiderGuageList.list[i].branchRefNumberGen; //№ присоединения
        if ENFiderGuageList.list[i].currentPhaseYellow = nil then
          Cells[3, i + 1] := '' //Ток жёлтой фазы, А
        else
          Cells[3, i + 1] :=
            ENFiderGuageList.list[i].currentPhaseYellow.DecimalString;
        if ENFiderGuageList.list[i].currentPhaseGreen = nil then
          Cells[4, i + 1] := '' //Ток зелёной фазы, А
        else
          Cells[4, i + 1] :=
            ENFiderGuageList.list[i].currentPhaseGreen.DecimalString;
        if ENFiderGuageList.list[i].currentPhaseRed = nil then
          Cells[5, i + 1] := '' //Ток красной фазы, А
        else
          Cells[5, i + 1] :=
            ENFiderGuageList.list[i].currentPhaseRed.DecimalString;
        if ENFiderGuageList.list[i].tensionPhaseYellow = nil then
          Cells[6, i + 1] := '' //Напряжение жёлтой фазы, кВ
        else
          Cells[6, i + 1] :=
            ENFiderGuageList.list[i].tensionPhaseYellow.DecimalString;
        if ENFiderGuageList.list[i].tensionPhaseGreen = nil then
          Cells[7, i + 1] := '' //Напряжение зелёной фазы, кВ
        else
          Cells[7,i + 1] := ENFiderGuageList.list[i].tensionPhaseGreen.DecimalString;

        if ENFiderGuageList.list[i].tensionPhaseRed = nil then
          Cells[8, i + 1] := '' //Напряжение красной фазы, кВ
        else
          Cells[8, i + 1] := ENFiderGuageList.list[i].tensionPhaseRed.DecimalString;

        Cells[9,i + 1] := ENFiderGuageList.list[i].substation04Name + ' (інв.№' + ENFiderGuageList.list[i].substation04InvNumber + ')';
        Cells[10,i + 1] := ENFiderGuageList.list[i].transformerName + ' (' + ENFiderGuageList.list[i].transformerNominalPower.DecimalString + ')';

        Cells[11, i + 1] := ENFiderGuageList.list[i].workerSurname;
        if (ENFiderGuageList.list[i].workerName <> 'Введите сами')
        and (ENFiderGuageList.list[i].workerName <> '')
        then //ФИО сотрудника, производившего замеры
          Cells[11, i + 1] := Cells[11, i + 1] + ' ' +
            ENFiderGuageList.list[i].workerName;
        if (ENFiderGuageList.list[i].workerPatronimic <> 'Введите сами')
        and (ENFiderGuageList.list[i].workerPatronimic <> '')
        then
          Cells[11, i + 1] := Cells[11, i + 1] + ' ' +
            ENFiderGuageList.list[i].workerPatronimic;
        LastRow := i + 1;
        sgENFiderGuage.RowCount := LastRow + 1;
      end;
  ColCount := ColCount + 1;
  sgENFiderGuage.Row := 1;
end;

procedure TfrmENFiderGuageShow.sgENFiderGuageTopLeftChanged(Sender: TObject);
var
  TempENFiderGuage: ENFiderGuageControllerSoapPort;
  i,CurrentRow: Integer;
  ENFiderGuageList: ENFiderGuageShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFiderGuage.TopRow + sgENFiderGuage.VisibleRowCount) = ColCount
  then
    begin
      TempENFiderGuage :=  HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;
      CurrentRow:=sgENFiderGuage.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFiderGuageFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFiderGuageList := TempENFiderGuage.getScrollableFilteredList(ENFiderGuageFilter(FilterObject),ColCount-1, 100);



  sgENFiderGuage.RowCount:=sgENFiderGuage.RowCount+100;
  LastCount:=High(ENFiderGuageList.list);
  with sgENFiderGuage do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFiderGuageList.list[i].code <> Low(Integer) then //Код
          Cells[0, i + CurrentRow] := IntToStr(ENFiderGuageList.list[i].code)
        else
          Cells[0, i + CurrentRow] := '';

        if ENFiderGuageList.list[i].dateGuage = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDateTimeOnlyDate2String(ENFiderGuageList.list[i].dateGuage);

        Cells[2, i + CurrentRow] := ENFiderGuageList.list[i].branchRefNumberGen; //№ присоединения
        if ENFiderGuageList.list[i].currentPhaseYellow = nil then
          Cells[3, i + CurrentRow] := '' //Ток жёлтой фазы, А
        else
          Cells[3, i + CurrentRow] :=
            ENFiderGuageList.list[i].currentPhaseYellow.DecimalString;
        if ENFiderGuageList.list[i].currentPhaseGreen = nil then
          Cells[4, i + CurrentRow] := '' //Ток зелёной фазы, А
        else
          Cells[4, i + CurrentRow] :=
            ENFiderGuageList.list[i].currentPhaseGreen.DecimalString;
        if ENFiderGuageList.list[i].currentPhaseRed = nil then
          Cells[5, i + CurrentRow] := '' //Ток красной фазы, А
        else
          Cells[5, i + CurrentRow] :=
            ENFiderGuageList.list[i].currentPhaseRed.DecimalString;
        if ENFiderGuageList.list[i].tensionPhaseYellow = nil then
          Cells[6, i + CurrentRow] := '' //Напряжение жёлтой фазы, кВ
        else
          Cells[6, i + CurrentRow] :=
            ENFiderGuageList.list[i].tensionPhaseYellow.DecimalString;
        if ENFiderGuageList.list[i].tensionPhaseGreen = nil then
          Cells[7, i + CurrentRow] := '' //Напряжение зелёной фазы, кВ
        else
          Cells[7,i + CurrentRow] :=
            ENFiderGuageList.list[i].tensionPhaseGreen.DecimalString;
        if ENFiderGuageList.list[i].tensionPhaseRed = nil then
          Cells[8, i + CurrentRow] := '' //Напряжение красной фазы, кВ
        else
          Cells[8, i + CurrentRow] :=
            ENFiderGuageList.list[i].tensionPhaseRed.DecimalString;

        Cells[9,i + CurrentRow] := ENFiderGuageList.list[i].substation04Name + ' (інв.№' + ENFiderGuageList.list[i].substation04InvNumber + ')';
        Cells[10,i + CurrentRow] := ENFiderGuageList.list[i].transformerName + ' (' + ENFiderGuageList.list[i].transformerNominalPower.DecimalString + ')';


        Cells[11, i + CurrentRow] := ENFiderGuageList.list[i].workerSurname;
        if (ENFiderGuageList.list[i].workerName <> 'Введите сами')
        and (ENFiderGuageList.list[i].workerName <> '')
        then //ФИО сотрудника, производившего замеры
          Cells[11, i + CurrentRow] := Cells[11, i + CurrentRow] + ' ' +
            ENFiderGuageList.list[i].workerName;
        if (ENFiderGuageList.list[i].workerPatronimic <> 'Введите сами')
        and (ENFiderGuageList.list[i].workerPatronimic <> '')
        then
          Cells[11, i + CurrentRow] := Cells[11, i + CurrentRow] + ' ' +
            ENFiderGuageList.list[i].workerPatronimic;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFiderGuage.Row:=CurrentRow-5;
   sgENFiderGuage.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFiderGuageShow.sgENFiderGuageDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFiderGuage,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFiderGuageShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFiderGuage.RowCount-1 do
   for j:=0 to sgENFiderGuage.ColCount-1 do
     sgENFiderGuage.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFiderGuageShow.actViewExecute(Sender: TObject);
Var TempENFiderGuage: ENFiderGuageControllerSoapPort;
begin
 TempENFiderGuage := HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;
   try
     ENFiderGuageObj := TempENFiderGuage.getObject(StrToInt(sgENFiderGuage.Cells[0,sgENFiderGuage.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFiderGuageEdit:=TfrmENFiderGuageEdit.Create(Application, dsView);
  try
    frmENFiderGuageEdit.ShowModal;
  finally
    frmENFiderGuageEdit.Free;
    frmENFiderGuageEdit:=nil;
  end;
end;

procedure TfrmENFiderGuageShow.actEditExecute(Sender: TObject);
Var TempENFiderGuage: ENFiderGuageControllerSoapPort;
begin
 TempENFiderGuage := HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;
   try
     ENFiderGuageObj := TempENFiderGuage.getObject(StrToInt(sgENFiderGuage.Cells[0,sgENFiderGuage.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFiderGuageEdit:=TfrmENFiderGuageEdit.Create(Application, dsEdit);
  try
    if frmENFiderGuageEdit.ShowModal= mrOk then
      begin
        //TempENFiderGuage.save(ENFiderGuageObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFiderGuageEdit.Free;
    frmENFiderGuageEdit:=nil;
  end;
end;

procedure TfrmENFiderGuageShow.actDeleteExecute(Sender: TObject);
Var TempENFiderGuage: ENFiderGuageControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFiderGuage := HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFiderGuage.Cells[0,sgENFiderGuage.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Замеры пофидерной нагрузки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFiderGuage.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFiderGuageShow.actInsertExecute(Sender: TObject);
// Var TempENFiderGuage: ENFiderGuageControllerSoapPort; 
begin
  // TempENFiderGuage := HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENFiderGuageObj:=ENFiderGuage.Create;

   //ENFiderGuageObj.currentPhaseYellow:= TXSDecimal.Create;
   //ENFiderGuageObj.currentPhaseGreen:= TXSDecimal.Create;
   //ENFiderGuageObj.currentPhaseRed:= TXSDecimal.Create;
   //ENFiderGuageObj.tensionPhaseYellow:= TXSDecimal.Create;
   //ENFiderGuageObj.tensionPhaseGreen:= TXSDecimal.Create;
   //ENFiderGuageObj.tensionPhaseRed:= TXSDecimal.Create;
   //ENFiderGuageObj.dateGuage:= TXSDate.Create;


  try
    frmENFiderGuageEdit:=TfrmENFiderGuageEdit.Create(Application, dsInsert);
    try
      if frmENFiderGuageEdit.ShowModal = mrOk then
      begin
        if ENFiderGuageObj<>nil then
            //TempENFiderGuage.add(ENFiderGuageObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFiderGuageEdit.Free;
      frmENFiderGuageEdit:=nil;
    end;
  finally
    ENFiderGuageObj.Free;
  end;
end;

procedure TfrmENFiderGuageShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFiderGuageShow.actFilterExecute(Sender: TObject);
begin
{frmENFiderGuageFilterEdit:=TfrmENFiderGuageFilterEdit.Create(Application, dsInsert);
  try
    ENFiderGuageFilterObj := ENFiderGuageFilter.Create;
    SetNullIntProps(ENFiderGuageFilterObj);
    SetNullXSProps(ENFiderGuageFilterObj);

    if frmENFiderGuageFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFiderGuageFilter.Create;
      FilterObject := ENFiderGuageFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFiderGuageFilterEdit.Free;
    frmENFiderGuageFilterEdit:=nil;
  end;}
end;

procedure TfrmENFiderGuageShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.