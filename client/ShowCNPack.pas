
unit ShowCNPack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  CNPackController, AdvObj ;


type
  TfrmCNPackShow = class(TChildForm)  
  HTTPRIOCNPack: THTTPRIO;
    ImageList1: TImageList;
    sgCNPack: TAdvStringGrid;
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
    actSelect: TAction;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgCNPackTopLeftChanged(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actSelectExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmCNPackShow : TfrmCNPackShow;
 // CNPackObj: CNPack;
 // CNPackFilterObj: CNPackFilter;
  
  
implementation

uses Main, EditCNPack, EditCNPackFilter;


{$R *.dfm}

var
  //frmCNPackShow : TfrmCNPackShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  CNPackHeaders: array [1..17] of String =
        ( 'Код'
          ,'Код пакета'
          ,'Назва'
          ,'РЕЗ і ЕМ'
          ,'Підсистема' //***
          ,'Статус пакету'
          ,'Опис'
          ,'Потужність'
          ,'Адреса об''єкта'
          ,'№ договора про приєднання'
          ,'Дата договора про приєднання'
          ,'№ ТУ'
          ,'Дата ТУ'
          ,'№ договора про розробку ТУ'
          ,'Дата договора про розробку ТУ'
          ,'№ проекта'
          ,'Дата погодження проекта'
        );


procedure TfrmCNPackShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmCNPackShow:=nil;
  inherited;
end;


procedure TfrmCNPackShow.FormShow(Sender: TObject);
var
  TempCNPack: CNPackControllerSoapPort;
  i: Integer;
  CNPackList: CNPackShortList;
begin
  SetGridHeaders(CNPackHeaders, sgCNPack.ColumnHeaders);
  DisableActions([actInsert, actEdit, actDelete]);

  ColCount:=100;

  TempCNPack :=  HTTPRIOCNPack as CNPackControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := CNPackFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  CNPackList := TempCNPack.getCNPackList(CNPackFilter(FilterObject),0,ColCount);


  LastCount:=High(CNPackList.list);

  if LastCount > -1 then
     sgCNPack.RowCount:=LastCount+2
  else
     sgCNPack.RowCount:=2;

   with sgCNPack do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if CNPackList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(CNPackList.list[i].code)
        else
          Cells[0,i+1] := '';
        if CNPackList.list[i].packCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(CNPackList.list[i].packCode);
        Cells[2,i+1] := CNPackList.list[i].name;
        Cells[3,i+1] := CNPackList.list[i].renName;

        Cells[4,i+1] := CNPackList.list[i].subsystemRefName; //***
        Objects[4,i+1] := TObject(CNPackList.list[i].subsystemRefCode); //***

        Cells[5,i+1] := CNPackList.list[i].statusName;
        Cells[6,i+1] := CNPackList.list[i].description;
        if CNPackList.list[i].power = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := CNPackList.list[i].power.DecimalString;
        Cells[8,i+1] := CNPackList.list[i].address;
        Cells[9,i+1] := CNPackList.list[i].reg_num_cn_contract;
        if CNPackList.list[i].date_cn_contract = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDate2String(CNPackList.list[i].date_cn_contract);
        Cells[11,i+1] := CNPackList.list[i].reg_num_tu_contract;
        if CNPackList.list[i].date_tu_contract = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := XSDate2String(CNPackList.list[i].date_tu_contract);
        Cells[13,i+1] := CNPackList.list[i].reg_num_tu_cr_contract;
        if CNPackList.list[i].date_tu_cr_contract = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := XSDate2String(CNPackList.list[i].date_tu_cr_contract);
        Cells[15,i+1] := CNPackList.list[i].project_num;
        if CNPackList.list[i].project_date = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := XSDate2String(CNPackList.list[i].project_date);
        LastRow:=i+1;
        sgCNPack.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgCNPack.Row:=1;
end;

procedure TfrmCNPackShow.sgCNPackTopLeftChanged(Sender: TObject);
var
  TempCNPack: CNPackControllerSoapPort;
  i,CurrentRow: Integer;
  CNPackList: CNPackShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgCNPack.TopRow + sgCNPack.VisibleRowCount) = ColCount
  then
    begin
      TempCNPack :=  HTTPRIOCNPack as CNPackControllerSoapPort;
      CurrentRow:=sgCNPack.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := CNPackFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  CNPackList := TempCNPack.getCNPackList(CNPackFilter(FilterObject),ColCount-1, 100);



  sgCNPack.RowCount:=sgCNPack.RowCount+100;
  LastCount:=High(CNPackList.list);
  with sgCNPack do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if CNPackList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(CNPackList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';
        if CNPackList.list[i].packCode = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(CNPackList.list[i].packCode);
        Cells[2,i+CurrentRow] := CNPackList.list[i].name;
        Cells[3,i+CurrentRow] := CNPackList.list[i].renName;

        Cells[4,i+CurrentRow] := CNPackList.list[i].subsystemRefName; //***
        Objects[4,i+CurrentRow] := TObject(CNPackList.list[i].subsystemRefCode); //***

        Cells[5,i+CurrentRow] := CNPackList.list[i].statusName;
        Cells[6,i+CurrentRow] := CNPackList.list[i].description;
        if CNPackList.list[i].power = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := CNPackList.list[i].power.DecimalString;
        Cells[8,i+CurrentRow] := CNPackList.list[i].address;
        Cells[9,i+CurrentRow] := CNPackList.list[i].reg_num_cn_contract;
        if CNPackList.list[i].date_cn_contract = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := XSDate2String(CNPackList.list[i].date_cn_contract);
        Cells[11,i+CurrentRow] := CNPackList.list[i].reg_num_tu_contract;
        if CNPackList.list[i].date_tu_contract = nil then
          Cells[12,i+CurrentRow] := ''
        else
          Cells[12,i+CurrentRow] := XSDate2String(CNPackList.list[i].date_tu_contract);
        Cells[13,i+CurrentRow] := CNPackList.list[i].reg_num_tu_cr_contract;
        if CNPackList.list[i].date_tu_cr_contract = nil then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := XSDate2String(CNPackList.list[i].date_tu_cr_contract);
        Cells[15,i+CurrentRow] := CNPackList.list[i].project_num;
        if CNPackList.list[i].project_date = nil then
          Cells[16,i+CurrentRow] := ''
        else
          Cells[16,i+CurrentRow] := XSDate2String(CNPackList.list[i].project_date);

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgCNPack.Row:=CurrentRow-5;
   sgCNPack.RowCount:=LastRow+1;
  end;
end;

procedure TfrmCNPackShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgCNPack.RowCount-1 do
   for j:=0 to sgCNPack.ColCount-1 do
     sgCNPack.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmCNPackShow.actViewExecute(Sender: TObject);
Var TempCNPack: CNPackControllerSoapPort;
begin
 TempCNPack := HTTPRIOCNPack as CNPackControllerSoapPort;
   try
     CNPackObj := TempCNPack.getObject(StrToInt(sgCNPack.Cells[0,sgCNPack.Row]));
   except
   on EConvertError do Exit;
  end;
  frmCNPackEdit:=TfrmCNPackEdit.Create(Application, dsView);
  try
    frmCNPackEdit.ShowModal;
  finally
    frmCNPackEdit.Free;
    frmCNPackEdit:=nil;
  end;
end;

procedure TfrmCNPackShow.actEditExecute(Sender: TObject);
Var TempCNPack: CNPackControllerSoapPort;
begin
 TempCNPack := HTTPRIOCNPack as CNPackControllerSoapPort;
   try
     CNPackObj := TempCNPack.getObject(StrToInt(sgCNPack.Cells[0,sgCNPack.Row]));
   except
   on EConvertError do Exit;
  end;
  frmCNPackEdit:=TfrmCNPackEdit.Create(Application, dsEdit);
  try
    if frmCNPackEdit.ShowModal= mrOk then
      begin
        //TempCNPack.save(CNPackObj);
        UpdateGrid(Sender);
      end;
  finally
    frmCNPackEdit.Free;
    frmCNPackEdit:=nil;
  end;
end;

procedure TfrmCNPackShow.actDeleteExecute(Sender: TObject);
Var TempCNPack: CNPackControllerSoapPort;
  ObjCode: Integer;
begin
 TempCNPack := HTTPRIOCNPack as CNPackControllerSoapPort;
   try
     ObjCode := StrToInt(sgCNPack.Cells[0,sgCNPack.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Пакети документів з EnergyWorkflow) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempCNPack.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmCNPackShow.actInsertExecute(Sender: TObject);
// Var TempCNPack: CNPackControllerSoapPort; 
begin
  // TempCNPack := HTTPRIOCNPack as CNPackControllerSoapPort;  /// Это здесь уже лишнее!!!
  CNPackObj:=CNPack.Create;

   //CNPackObj.power:= TXSDecimal.Create;
   //CNPackObj.date_cn_contract:= TXSDate.Create;
   //CNPackObj.date_tu_contract:= TXSDate.Create;
   //CNPackObj.date_tu_cr_contract:= TXSDate.Create;
   //CNPackObj.project_date:= TXSDate.Create;


  try
    frmCNPackEdit:=TfrmCNPackEdit.Create(Application, dsInsert);
    try
      if frmCNPackEdit.ShowModal = mrOk then
      begin
        if CNPackObj<>nil then
            //TempCNPack.add(CNPackObj);
            UpdateGrid(Sender);
      end;
    finally
      frmCNPackEdit.Free;
      frmCNPackEdit:=nil;
    end;
  finally
    CNPackObj.Free;
  end;
end;

procedure TfrmCNPackShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmCNPackShow.actFilterExecute(Sender: TObject);
begin
  frmCNPackFilterEdit:=TfrmCNPackFilterEdit.Create(Application, dsInsert);
  try
    CNPackFilterObj := CNPackFilter.Create;
    SetNullIntProps(CNPackFilterObj);
    SetNullXSProps(CNPackFilterObj);

    if frmCNPackFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := CNPackFilter.Create;
      FilterObject := CNPackFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmCNPackFilterEdit.Free;
    frmCNPackFilterEdit:=nil;
  end;
end;

procedure TfrmCNPackShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmCNPackShow.actSelectExecute(Sender: TObject);
var temp: Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      //temp := StrToInt(GetReturnValue(sgCNPack, 0));
      temp := StrToInt(GetReturnValue(sgCNPack, 1));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    //actViewExecute(Sender);
  end;
end;

end.
