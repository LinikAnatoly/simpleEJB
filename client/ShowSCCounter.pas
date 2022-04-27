
unit ShowSCCounter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  SCCounterController, AdvObj ;


type
  TfrmSCCounterShow = class(TChildForm)  
  HTTPRIOSCCounter: THTTPRIO;
    ImageList1: TImageList;
    sgSCCounter: TAdvStringGrid;
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
procedure sgSCCounterTopLeftChanged(Sender: TObject);
procedure sgSCCounterDblClick(Sender: TObject);
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
 frmSCCounterShow : TfrmSCCounterShow;
 // SCCounterObj: SCCounter;
 // SCCounterFilterObj: SCCounterFilter;
  
  
implementation

uses Main, EditSCCounter, EditSCCounterFilter;


{$R *.dfm}

var
  //frmSCCounterShow : TfrmSCCounterShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  SCCounterHeaders: array [1..16] of String =
        ( 'Код'
          ,'Інв. номер'
          ,'Найменування  лічільника'
          ,'Заводский номер'
          ,'счет'
          ,'Підрозділ'
          ,'код МОЛа'
          ,'Дата приходу'
          ,'Дата випуску'
          ,'Дата поверки'
          ,'Вартість'
          ,'код з ScanCounter'
          ,'Тип  лічільника'
          ,'№ наряду на установку'
          ,'Показники'
          ,'дата последнего изменения'
        );
   

procedure TfrmSCCounterShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmSCCounterShow:=nil;
    inherited;
  end;


procedure TfrmSCCounterShow.FormShow(Sender: TObject);
var
  TempSCCounter: SCCounterControllerSoapPort;
  i: Integer;
  SCCounterList: SCCounterShortList;
  begin
  SetGridHeaders(SCCounterHeaders, sgSCCounter.ColumnHeaders);
  ColCount:=100;
  TempSCCounter :=  HTTPRIOSCCounter as SCCounterControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := SCCounterFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCCounterList := TempSCCounter.getScrollableFilteredList(SCCounterFilter(FilterObject),0,ColCount);


  LastCount:=High(SCCounterList.list);

  if LastCount > -1 then
     sgSCCounter.RowCount:=LastCount+2
  else
     sgSCCounter.RowCount:=2;

   with sgSCCounter do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCCounterList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCCounterList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := SCCounterList.list[i].invNumber;
        Cells[2,i+1] := SCCounterList.list[i].name;
        Cells[3,i+1] := SCCounterList.list[i].buildNumber;
        Cells[4,i+1] := SCCounterList.list[i].account;
        Cells[5,i+1] := SCCounterList.list[i].departmetFKCode;
        Cells[6,i+1] := SCCounterList.list[i].molCode;
        if SCCounterList.list[i].dateIn = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(SCCounterList.list[i].dateIn);
        if SCCounterList.list[i].dateBuild = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(SCCounterList.list[i].dateBuild);
        if SCCounterList.list[i].dateCheck = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(SCCounterList.list[i].dateCheck);
        if SCCounterList.list[i].cost = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := SCCounterList.list[i].cost.DecimalString;
        if SCCounterList.list[i].scCode = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(SCCounterList.list[i].scCode);
        Cells[12,i+1] := SCCounterList.list[i].counterType;
        Cells[13,i+1] := SCCounterList.list[i].installOrderNumber;
        Cells[14,i+1] := SCCounterList.list[i].reading;
        if SCCounterList.list[i].dateEdit = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := XSDateTimeWithDate2String(SCCounterList.list[i].dateEdit);
        LastRow:=i+1;
        sgSCCounter.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgSCCounter.Row:=1;
end;

procedure TfrmSCCounterShow.sgSCCounterTopLeftChanged(Sender: TObject);
var
  TempSCCounter: SCCounterControllerSoapPort;
  i,CurrentRow: Integer;
  SCCounterList: SCCounterShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgSCCounter.TopRow + sgSCCounter.VisibleRowCount) = ColCount
  then
    begin
      TempSCCounter :=  HTTPRIOSCCounter as SCCounterControllerSoapPort;
      CurrentRow:=sgSCCounter.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := SCCounterFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  SCCounterList := TempSCCounter.getScrollableFilteredList(SCCounterFilter(FilterObject),ColCount-1, 100);



  sgSCCounter.RowCount:=sgSCCounter.RowCount+100;
  LastCount:=High(SCCounterList.list);
  with sgSCCounter do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCCounterList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(SCCounterList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := SCCounterList.list[i].invNumber;
        Cells[2,i+CurrentRow] := SCCounterList.list[i].name;
        Cells[3,i+CurrentRow] := SCCounterList.list[i].buildNumber;
        Cells[4,i+CurrentRow] := SCCounterList.list[i].account;
        Cells[5,i+CurrentRow] := SCCounterList.list[i].departmetFKCode;
        Cells[6,i+CurrentRow] := SCCounterList.list[i].molCode;
        if SCCounterList.list[i].dateIn = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDate2String(SCCounterList.list[i].dateIn);
        if SCCounterList.list[i].dateBuild = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDate2String(SCCounterList.list[i].dateBuild);
        if SCCounterList.list[i].dateCheck = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDate2String(SCCounterList.list[i].dateCheck);
        if SCCounterList.list[i].cost = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := SCCounterList.list[i].cost.DecimalString;
        if SCCounterList.list[i].scCode = Low(Integer) then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := IntToStr(SCCounterList.list[i].scCode);
        Cells[12,i+CurrentRow] := SCCounterList.list[i].counterType;
        Cells[13,i+CurrentRow] := SCCounterList.list[i].installOrderNumber;
        Cells[14,i+CurrentRow] := SCCounterList.list[i].reading;
        if SCCounterList.list[i].dateEdit = nil then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := XSDateTimeWithDate2String(SCCounterList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgSCCounter.Row:=CurrentRow-5;
   sgSCCounter.RowCount:=LastRow+1;
  end;
end;

procedure TfrmSCCounterShow.sgSCCounterDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgSCCounter,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmSCCounterShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgSCCounter.RowCount-1 do
   for j:=0 to sgSCCounter.ColCount-1 do
     sgSCCounter.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmSCCounterShow.actViewExecute(Sender: TObject);
Var TempSCCounter: SCCounterControllerSoapPort;
begin
 TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;
   try
     SCCounterObj := TempSCCounter.getObject(StrToInt(sgSCCounter.Cells[0,sgSCCounter.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCCounterEdit:=TfrmSCCounterEdit.Create(Application, dsView);
  try
    frmSCCounterEdit.ShowModal;
  finally
    frmSCCounterEdit.Free;
    frmSCCounterEdit:=nil;
  end;
end;

procedure TfrmSCCounterShow.actEditExecute(Sender: TObject);
Var TempSCCounter: SCCounterControllerSoapPort;
begin
 TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;
   try
     SCCounterObj := TempSCCounter.getObject(StrToInt(sgSCCounter.Cells[0,sgSCCounter.Row]));
   except
   on EConvertError do Exit;
  end;
  frmSCCounterEdit:=TfrmSCCounterEdit.Create(Application, dsEdit);
  try
    if frmSCCounterEdit.ShowModal= mrOk then
      begin
        //TempSCCounter.save(SCCounterObj);
        UpdateGrid(Sender);
      end;
  finally
    frmSCCounterEdit.Free;
    frmSCCounterEdit:=nil;
  end;
end;

procedure TfrmSCCounterShow.actDeleteExecute(Sender: TObject);
Var TempSCCounter: SCCounterControllerSoapPort;
  ObjCode: Integer;
begin
 TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;
   try
     ObjCode := StrToInt(sgSCCounter.Cells[0,sgSCCounter.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Прилади обліку для СканСчетчиков) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempSCCounter.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmSCCounterShow.actInsertExecute(Sender: TObject);
Var TempSCCounter: SCCounterControllerSoapPort;
begin
  TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;
  SCCounterObj:=SCCounter.Create;

   //SCCounterObj.dateIn:= TXSDate.Create;
   //SCCounterObj.dateBuild:= TXSDate.Create;
   //SCCounterObj.dateCheck:= TXSDate.Create;
   //SCCounterObj.cost:= TXSDecimal.Create;
   //SCCounterObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmSCCounterEdit:=TfrmSCCounterEdit.Create(Application, dsInsert);
    try
      if frmSCCounterEdit.ShowModal = mrOk then
      begin
        if SCCounterObj<>nil then
            //TempSCCounter.add(SCCounterObj);
            UpdateGrid(Sender);
      end;
    finally
      frmSCCounterEdit.Free;
      frmSCCounterEdit:=nil;
    end;
  finally
    SCCounterObj.Free;
  end;
end;

procedure TfrmSCCounterShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmSCCounterShow.actFilterExecute(Sender: TObject);
begin
{frmSCCounterFilterEdit:=TfrmSCCounterFilterEdit.Create(Application, dsInsert);
  try
    SCCounterFilterObj := SCCounterFilter.Create;
    SetNullIntProps(SCCounterFilterObj);
    SetNullXSProps(SCCounterFilterObj);

    if frmSCCounterFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := SCCounterFilter.Create;
      FilterObject := SCCounterFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmSCCounterFilterEdit.Free;
    frmSCCounterFilterEdit:=nil;
  end;}
end;

procedure TfrmSCCounterShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.