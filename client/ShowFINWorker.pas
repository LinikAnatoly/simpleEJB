
unit ShowFINWorker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINWorkerController, AdvObj ;

const FINWORKERSHORT_OBJECT_NUMBER = 1;
type
  TfrmFINWorkerShow = class(TChildForm)  
  HTTPRIOFINWorker: THTTPRIO;
    ImageList1: TImageList;
    sgFINWorker: TAdvStringGrid;
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
procedure sgFINWorkerTopLeftChanged(Sender: TObject);
procedure sgFINWorkerDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
procedure FormCreate(Sender: TObject);
///class procedure chooseFromList(proc: TProcChooseFINWorkerHandler; dateGet : TXSDate); stdcall; static; override;

  private
   { Private declarations }
 public
   { Public declarations }
   humenKindCode : Integer;
   dateGet : TXSDate;
   isForTechCondResponsiblesList: Boolean;
   isShowCEO : Boolean; // переменная - показывать или нет Керівництво
   forReport : Boolean;
class function chooseFromList(dateGet : TXSDate; departmentCode : WideString) : FINWorkerShort; overload; stdcall; static;
class function chooseFromList(dateGet : TXSDate; f : FINWorkerFilter = nil) : FINWorkerShort; overload; stdcall; static;
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmFINWorkerShow : TfrmFINWorkerShow;
 // FINWorkerObj: FINWorker;
 // FINWorkerFilterObj: FINWorkerFilter;
  
  
implementation

uses Main, EditFINWorker, EditFINWorkerFilter, ENConsts;


{$R *.dfm}

var
  //frmFINWorkerShow : TfrmFINWorkerShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINWorkerHeaders: array [1..16] of String =
        ( 'Код'
          ,'ФІО працівника'
          ,'табельний номер'
          ,'Посада'
          ,'код посади із кадрів'
          ,'Підрозділ'
          ,'код підрозділу'
          ,'оклад'
          ,'код категорії посади'
          ,'код із кадрів'
          ,'код штатного'
          ,'код РЭС'
          ,'ID категории персонала'
          ,'Категорія персонала'
          ,'ID графіку робочого часу'
          ,'ID посади (MS Dynamics AX)'
        );
		
class function TfrmFINWorkerShow.chooseFromList(dateGet : TXSDate;
departmentCode : WideString) : FINWorkerShort;
var
f : FINWorkerFilter;
begin
  f := FINWorkerFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.departmentCode := departmentCode;
  TfrmFINWorkerShow.chooseFromList(dateGet, f);
end;

class function TfrmFINWorkerShow.chooseFromList(dateGet : TXSDate;
f : FINWorkerFilter) : FINWorkerShort;
var
  f1 : FINWorkerFilter;
  frmFINWorkerShow : TfrmFINWorkerShow;
  selected : FINWorkerShort;
begin
  inherited;
     if not Assigned(f) then begin
       f1 := FINWorkerFilter.Create;
       SetNullXSProps(f1);
       SetNullIntProps(f1);
       f1.departmentCode := '-1';
	 end else begin
	   f1 := f;
	 end;

     frmFINWorkerShow := TfrmFINWorkerShow.Create(Application,fmNormal, f1);
     frmFINWorkerShow.dateGet := dateGet;
     selected := nil;
       try
          with frmFINWorkerShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := FINWorkerShort(sgFINWorker.Objects[FINWORKERSHORT_OBJECT_NUMBER
                      , sgFINWorker.Row]);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
          Result := selected;
       finally
          frmFINWorkerShow.Free;
       end;
end;

procedure TfrmFINWorkerShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINWorkerShow:=nil;
    inherited;
  end;

{
procedure TfrmFINWorkerShow.FormShow(Sender: TObject);
var
  TempFINWorker: FINWorkerControllerSoapPort;
  i: Integer;
  FINWorkerList: FINWorkerShortList;
  begin
  SetGridHeaders(FINWorkerHeaders, sgFINWorker.ColumnHeaders);
  ColCount:=100;
  TempFINWorker :=  HTTPRIOFINWorker as FINWorkerControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINWorkerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  //FINWorkerList := TempFINWorker.getWorkerList(FINWorkerFilter(FilterObject),0,ColCount);


  LastCount:= 1;

  if LastCount > -1 then
     sgFINWorker.RowCount:=LastCount+2
  else
     sgFINWorker.RowCount:=2;

   with sgFINWorker do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        //if FINWorkerList.list[i].code <> Low(Integer) then
        //Cells[0,i+1] := IntToStr(FINWorkerList.list[i].code)
        //else
        Cells[0,i+1] := '';
        Cells[1,i+1] := 'fio VAsyPupkin';
        //if FINWorkerList.list[i].tabNumber = Low(Integer) then
          Cells[2,i+1] := '555';
        //else
        //  Cells[2,i+1] := IntToStr(FINWorkerList.list[i].tabNumber);
        Cells[3,i+1] := 'direktor';
        //if FINWorkerList.list[i].positionCode = Low(Integer) then
          Cells[4,i+1] := '111';
        //else
        //  Cells[4,i+1] := IntToStr(FINWorkerList.list[i].positionCode);
        Cells[5,i+1] := 'super RES';
        Cells[6,i+1] := '-1';//FINWorkerList.list[i].departmentCode;
        //if FINWorkerList.list[i].priceGen = nil then
          Cells[7,i+1] := '333.4';
        //else
        //  Cells[7,i+1] := FINWorkerList.list[i].priceGen.DecimalString;
        //if FINWorkerList.list[i].categor = Low(Integer) then
          Cells[8,i+1] := '666';
        //else
        //  Cells[8,i+1] := IntToStr(FINWorkerList.list[i].categor);
        //if FINWorkerList.list[i].finCode = Low(Integer) then
          Cells[9,i+1] := '345';
        //else
        //  Cells[9,i+1] := IntToStr(FINWorkerList.list[i].finCode);
        LastRow:=i+1;
        sgFINWorker.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINWorker.Row:=1;
end;
}


procedure TfrmFINWorkerShow.FormShow(Sender: TObject);
var
  TempFINWorker: FINWorkerControllerSoapPort;
  i: Integer;
  FINWorkerList: FINWorkerShortList;
  condition : String;
begin
  SetGridHeaders(FINWorkerHeaders, sgFINWorker.ColumnHeaders);
  ColCount:=100;
  TempFINWorker :=  HTTPRIOFINWorker as FINWorkerControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINWorkerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

{
скажем что ЭТОГО чела низя гнать на работу на линию ...

  if humenKindCode = ENHUMENITEMKIND_ELTEH then
  begin
      condition :=  FINWorkerFilter(FilterObject).conditionSQL;
      AddCondition(condition, 'upper( kr.prim ) like (''%НВЗ%'')');
      FINWorkerFilter(FilterObject).conditionSQL := condition;
  end;
}
  if forReport then
   FINWorkerList := TempFINWorker.getWorkerListForReport(FINWorkerFilter(FilterObject), 0, ColCount, isShowCEO)
  else

  if isForTechCondResponsiblesList then
  begin
    FINWorkerList := TempFINWorker.getFINWorkerByTechCondResponsibleList(FINWorkerFilter(FilterObject), 0, ColCount);
  end
  else begin
    // типа брать данные на дату .. если она есть ..
    if (dateGet <> nil) then
      FINWorkerList := TempFINWorker.getWorkerList(FINWorkerFilter(FilterObject), 0, ColCount, dateGet, isShowCEO)
    else
      FINWorkerList := TempFINWorker.getWorkerList(FINWorkerFilter(FilterObject), 0, ColCount, isShowCEO);
  end;


  LastCount:=High(FINWorkerList.list);

  if LastCount > -1 then
     sgFINWorker.RowCount:=LastCount+2
  else
     sgFINWorker.RowCount:=2;

   with sgFINWorker do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINWorkerList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINWorkerList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINWorkerList.list[i].name;

        if FINWorkerList.list[i].tabNumber = '' then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := FINWorkerList.list[i].tabNumber;

        Cells[3,i+1] := FINWorkerList.list[i].positionName;
        if FINWorkerList.list[i].positionCode = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(FINWorkerList.list[i].positionCode);
        Cells[5,i+1] := FINWorkerList.list[i].departmentName;
        Cells[6,i+1] := FINWorkerList.list[i].departmentCode;
        if FINWorkerList.list[i].priceGen = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ''; //FINWorkerList.list[i].priceGen.DecimalString;
        if FINWorkerList.list[i].categor = Low(Integer) then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := IntToStr(FINWorkerList.list[i].categor);
        if FINWorkerList.list[i].finCode = Low(Integer) then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := IntToStr(FINWorkerList.list[i].finCode);

        if FINWorkerList.list[i].doljnostid = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(FINWorkerList.list[i].doljnostid);

        if FINWorkerList.list[i].cehid = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(FINWorkerList.list[i].cehid);


        // припрячем оклад ...
        Objects[0, i+1] :=  TObject(FINWorkerList.list[i].priceGen.DecimalString);


        if FINWorkerList.list[i].categorId = Low(Integer) then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := IntToStr(FINWorkerList.list[i].categorId);

        Cells[13,i+1] := FINWorkerList.list[i].categorName;
        Cells[14,i+1] := FINWorkerList.list[i].workTimeId;
        Cells[15,i+1] := FINWorkerList.list[i].positionId;

        Objects[FINWORKERSHORT_OBJECT_NUMBER, i+1] :=  FINWorkerList.list[i];

        LastRow:=i+1;
        sgFINWorker.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINWorker.Row:=1;
end;



procedure TfrmFINWorkerShow.sgFINWorkerTopLeftChanged(Sender: TObject);
var
  TempFINWorker: FINWorkerControllerSoapPort;
  i,CurrentRow: Integer;
  FINWorkerList: FINWorkerShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINWorker.TopRow + sgFINWorker.VisibleRowCount) = ColCount
  then
    begin
      TempFINWorker :=  HTTPRIOFINWorker as FINWorkerControllerSoapPort;
      CurrentRow:=sgFINWorker.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINWorkerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if forReport then
   FINWorkerList := TempFINWorker.getWorkerListForReport(FINWorkerFilter(FilterObject), ColCount-1, 100, isShowCEO)
  else
  if isForTechCondResponsiblesList then
  begin
    FINWorkerList := TempFINWorker.getFINWorkerByTechCondResponsibleList(FINWorkerFilter(FilterObject), ColCount-1, 100);
  end
  else begin
    // типа брать данные на дату .. если она есть ..
    if (dateGet <> nil) then
      FINWorkerList := TempFINWorker.getWorkerList(FINWorkerFilter(FilterObject), ColCount-1, 100, dateGet, isShowCEO)
    else
      FINWorkerList := TempFINWorker.getWorkerList(FINWorkerFilter(FilterObject), ColCount-1, 100, isShowCEO);
  end;



  sgFINWorker.RowCount:=sgFINWorker.RowCount+100;
  LastCount:=High(FINWorkerList.list);
  with sgFINWorker do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINWorkerList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINWorkerList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := FINWorkerList.list[i].name;

        if FINWorkerList.list[i].tabNumber = '' then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := FINWorkerList.list[i].tabNumber;

        Cells[3,i+CurrentRow] := FINWorkerList.list[i].positionName;
        if FINWorkerList.list[i].positionCode = Low(Integer) then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := IntToStr(FINWorkerList.list[i].positionCode);
        Cells[5,i+CurrentRow] := FINWorkerList.list[i].departmentName;
        Cells[6,i+CurrentRow] := FINWorkerList.list[i].departmentCode;
        if FINWorkerList.list[i].priceGen = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := ''; //FINWorkerList.list[i].priceGen.DecimalString;
        if FINWorkerList.list[i].categor = Low(Integer) then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := IntToStr(FINWorkerList.list[i].categor);
        if FINWorkerList.list[i].finCode = Low(Integer) then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := IntToStr(FINWorkerList.list[i].finCode);

        if FINWorkerList.list[i].doljnostid = Low(Integer) then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := IntToStr(FINWorkerList.list[i].doljnostid);

        if FINWorkerList.list[i].cehid = Low(Integer) then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := IntToStr(FINWorkerList.list[i].cehid);
          

        // припрячем оклад ...
        Objects[0, i+CurrentRow] :=  TObject(FINWorkerList.list[i].priceGen.DecimalString);


        if FINWorkerList.list[i].categorId = Low(Integer) then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := IntToStr(FINWorkerList.list[i].categorId);

        Cells[13,i+CurrentRow] := FINWorkerList.list[i].categorName;
        Cells[14,i+CurrentRow] := FINWorkerList.list[i].workTimeId;
        Cells[15,i+CurrentRow] := FINWorkerList.list[i].positionId;

        Objects[FINWORKERSHORT_OBJECT_NUMBER, i+CurrentRow] :=  FINWorkerList.list[i];

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINWorker.Row:=CurrentRow-5;
   sgFINWorker.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINWorkerShow.sgFINWorkerDblClick(Sender: TObject);
Var
temp : Integer;
s : String;
begin

//showMessage( String(sgFINWorker.Objects[0, sgFINWorker.row]) );
  if FormMode = fmNormal then
  begin
    try
      //temp:=StrToInt(GetReturnValue(sgFINWorker,1)); // проверим чтоб ФИО было !!!
      s:=(GetReturnValue(sgFINWorker,1));
      if s = '' then Exit;
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINWorkerShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINWorker.RowCount-1 do
   for j:=0 to sgFINWorker.ColCount-1 do
     sgFINWorker.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINWorkerShow.actViewExecute(Sender: TObject);
Var TempFINWorker: FINWorkerControllerSoapPort;
begin
 TempFINWorker := HTTPRIOFINWorker as FINWorkerControllerSoapPort;
   try
     FINWorkerObj := TempFINWorker.getObject(StrToInt(sgFINWorker.Cells[0,sgFINWorker.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINWorkerEdit:=TfrmFINWorkerEdit.Create(Application, dsView);
  try
    frmFINWorkerEdit.ShowModal;
  finally
    frmFINWorkerEdit.Free;
    frmFINWorkerEdit:=nil;
  end;
end;

procedure TfrmFINWorkerShow.actEditExecute(Sender: TObject);
Var TempFINWorker: FINWorkerControllerSoapPort;
begin
 TempFINWorker := HTTPRIOFINWorker as FINWorkerControllerSoapPort;
   try
     FINWorkerObj := TempFINWorker.getObject(StrToInt(sgFINWorker.Cells[0,sgFINWorker.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINWorkerEdit:=TfrmFINWorkerEdit.Create(Application, dsEdit);
  try
    if frmFINWorkerEdit.ShowModal= mrOk then
      begin
        //TempFINWorker.save(FINWorkerObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINWorkerEdit.Free;
    frmFINWorkerEdit:=nil;
  end;
end;

procedure TfrmFINWorkerShow.actDeleteExecute(Sender: TObject);
Var TempFINWorker: FINWorkerControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINWorker := HTTPRIOFINWorker as FINWorkerControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINWorker.Cells[0,sgFINWorker.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Працівники з кадрів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINWorker.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINWorkerShow.actInsertExecute(Sender: TObject);
Var TempFINWorker: FINWorkerControllerSoapPort;
begin
  TempFINWorker := HTTPRIOFINWorker as FINWorkerControllerSoapPort;
  FINWorkerObj:=FINWorker.Create;

   FINWorkerObj.priceGen:= TXSDecimal.Create;


  try
    frmFINWorkerEdit:=TfrmFINWorkerEdit.Create(Application, dsInsert);
    try
      if frmFINWorkerEdit.ShowModal = mrOk then
      begin
        if FINWorkerObj<>nil then
            //TempFINWorker.add(FINWorkerObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINWorkerEdit.Free;
      frmFINWorkerEdit:=nil;
    end;
  finally
    FINWorkerObj.Free;
  end;
end;

procedure TfrmFINWorkerShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINWorkerShow.actFilterExecute(Sender: TObject);
begin
frmFINWorkerFilterEdit:=TfrmFINWorkerFilterEdit.Create(Application, dsEdit);
  try
    FINWorkerFilterObj := FINWorkerFilter.Create;
    SetNullIntProps(FINWorkerFilterObj);
    SetNullXSProps(FINWorkerFilterObj);

    if frmFINWorkerFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINWorkerFilter.Create;
      FilterObject := FINWorkerFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINWorkerFilterEdit.Free;
    frmFINWorkerFilterEdit:=nil;
  end;
end;

procedure TfrmFINWorkerShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmFINWorkerShow.FormCreate(Sender: TObject);
begin
  inherited;
  humenKindCode := LOW_INT;
  dateGet := nil;
  isForTechCondResponsiblesList := false;
  isShowCEO := false;
end;

end.