
unit ShowENContragent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENContragentController ;


type
  TfrmENContragentShow = class(TChildForm)  
  HTTPRIOENContragent: THTTPRIO;
    ImageList1: TImageList;
    sgENContragent: TAdvStringGrid;
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
procedure sgENContragentTopLeftChanged(Sender: TObject);
procedure sgENContragentDblClick(Sender: TObject);
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
 // ENContragentObj: ENContragent;
 // ENContragentFilterObj: ENContragentFilter;
  
  
implementation

uses Main, EditENContragent, EditENContragentFilter;


{$R *.dfm}

var
  //frmENContragentShow : TfrmENContragentShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENContragentHeaders: array [1..16] of String =
        ( 'Код'
          ,'Замовник'
          ,'Адреса замовника'
          ,'Адрес места проведения работ'
          ,'Посада замовника'
          ,'ОКПО(ІПН) замовника'
          ,'Розрахунковий рахунок замовника'
          ,'Найменування банку замовника'
          ,'МФО банку замовника'
          ,'Керівник'
          ,'Паспортні дані замовника'
          ,'Дата довіреності замовника'
          ,'№ довіреності замовника'
          ,'П.І.Б довіреної особи замовника'
          ,'Паспортні дані довіреної особи замовника'
          ,'Адреса довіреної особи замовника'
        );
   

procedure TfrmENContragentShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENContragentShow:=nil;
    inherited;
  end;


procedure TfrmENContragentShow.FormShow(Sender: TObject);
var
  TempENContragent: ENContragentControllerSoapPort;
  i: Integer;
  ENContragentList: ENContragentShortList;
  begin
  SetGridHeaders(ENContragentHeaders, sgENContragent.ColumnHeaders);
  ColCount:=100;
  TempENContragent :=  HTTPRIOENContragent as ENContragentControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENContragentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENContragentList := TempENContragent.getScrollableFilteredList(ENContragentFilter(FilterObject),0,ColCount);


  LastCount:=High(ENContragentList.list);

  if LastCount > -1 then
     sgENContragent.RowCount:=LastCount+2
  else
     sgENContragent.RowCount:=2;

   with sgENContragent do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENContragentList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENContragentList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENContragentList.list[i].contragentName;
        Cells[2,i+1] := ENContragentList.list[i].contragentAddress;
        Cells[3,i+1] := ENContragentList.list[i].contragentAddressWork;
        Cells[4,i+1] := ENContragentList.list[i].contragentPosition;
        Cells[5,i+1] := ENContragentList.list[i].contragentOkpo;
        Cells[6,i+1] := ENContragentList.list[i].contragentBankAccount;
        Cells[7,i+1] := ENContragentList.list[i].contragentBankName;
        Cells[8,i+1] := ENContragentList.list[i].contragentBankMfo;
        Cells[9,i+1] := ENContragentList.list[i].contragentBossName;
        Cells[10,i+1] := ENContragentList.list[i].contragentPassport;
        if ENContragentList.list[i].warrantDate = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := XSDate2String(ENContragentList.list[i].warrantDate);
        Cells[12,i+1] := ENContragentList.list[i].warrantNumber;
        Cells[13,i+1] := ENContragentList.list[i].warrantFIO;
        Cells[14,i+1] := ENContragentList.list[i].warrantPassport;
        Cells[15,i+1] := ENContragentList.list[i].warrantAddress;
        LastRow:=i+1;
        sgENContragent.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENContragent.Row:=1;
end;

procedure TfrmENContragentShow.sgENContragentTopLeftChanged(Sender: TObject);
var
  TempENContragent: ENContragentControllerSoapPort;
  i,CurrentRow: Integer;
  ENContragentList: ENContragentShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENContragent.TopRow + sgENContragent.VisibleRowCount) = ColCount
  then
    begin
      TempENContragent :=  HTTPRIOENContragent as ENContragentControllerSoapPort;
      CurrentRow:=sgENContragent.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENContragentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENContragentList := TempENContragent.getScrollableFilteredList(ENContragentFilter(FilterObject),ColCount-1, 100);



  sgENContragent.RowCount:=sgENContragent.RowCount+100;
  LastCount:=High(ENContragentList.list);
  with sgENContragent do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENContragentList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENContragentList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENContragentList.list[i].contragentName;
        Cells[2,i+CurrentRow] := ENContragentList.list[i].contragentAddress;
        Cells[3,i+CurrentRow] := ENContragentList.list[i].contragentAddressWork;
        Cells[4,i+CurrentRow] := ENContragentList.list[i].contragentPosition;
        Cells[5,i+CurrentRow] := ENContragentList.list[i].contragentOkpo;
        Cells[6,i+CurrentRow] := ENContragentList.list[i].contragentBankAccount;
        Cells[7,i+CurrentRow] := ENContragentList.list[i].contragentBankName;
        Cells[8,i+CurrentRow] := ENContragentList.list[i].contragentBankMfo;
        Cells[9,i+CurrentRow] := ENContragentList.list[i].contragentBossName;
        Cells[10,i+CurrentRow] := ENContragentList.list[i].contragentPassport;
        if ENContragentList.list[i].warrantDate = nil then
          Cells[11,i+CurrentRow] := ''
        else
          Cells[11,i+CurrentRow] := XSDate2String(ENContragentList.list[i].warrantDate);
        Cells[12,i+CurrentRow] := ENContragentList.list[i].warrantNumber;
        Cells[13,i+CurrentRow] := ENContragentList.list[i].warrantFIO;
        Cells[14,i+CurrentRow] := ENContragentList.list[i].warrantPassport;
        Cells[15,i+CurrentRow] := ENContragentList.list[i].warrantAddress;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENContragent.Row:=CurrentRow-5;
   sgENContragent.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENContragentShow.sgENContragentDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENContragent,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENContragentShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENContragent.RowCount-1 do
   for j:=0 to sgENContragent.ColCount-1 do
     sgENContragent.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENContragentShow.actViewExecute(Sender: TObject);
Var TempENContragent: ENContragentControllerSoapPort;
begin
 TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;
   try
     ENContragentObj := TempENContragent.getObject(StrToInt(sgENContragent.Cells[0,sgENContragent.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContragentEdit:=TfrmENContragentEdit.Create(Application, dsView);
  try
    frmENContragentEdit.ShowModal;
  finally
    frmENContragentEdit.Free;
    frmENContragentEdit:=nil;
  end;
end;

procedure TfrmENContragentShow.actEditExecute(Sender: TObject);
Var TempENContragent: ENContragentControllerSoapPort;
begin
 TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;
   try
     ENContragentObj := TempENContragent.getObject(StrToInt(sgENContragent.Cells[0,sgENContragent.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContragentEdit:=TfrmENContragentEdit.Create(Application, dsEdit);
  try
    if frmENContragentEdit.ShowModal= mrOk then
      begin
        //TempENContragent.save(ENContragentObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENContragentEdit.Free;
    frmENContragentEdit:=nil;
  end;
end;

procedure TfrmENContragentShow.actDeleteExecute(Sender: TObject);
Var TempENContragent: ENContragentControllerSoapPort;
  ObjCode: Integer;
begin
 TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;
   try
     ObjCode := StrToInt(sgENContragent.Cells[0,sgENContragent.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Замовник) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENContragent.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENContragentShow.actInsertExecute(Sender: TObject);
// Var TempENContragent: ENContragentControllerSoapPort; 
begin
  // TempENContragent := HTTPRIOENContragent as ENContragentControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENContragentObj:=ENContragent.Create;

   //ENContragentObj.warrantDate:= TXSDate.Create;


  try
    frmENContragentEdit:=TfrmENContragentEdit.Create(Application, dsInsert);
    try
      if frmENContragentEdit.ShowModal = mrOk then
      begin
        if ENContragentObj<>nil then
            //TempENContragent.add(ENContragentObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENContragentEdit.Free;
      frmENContragentEdit:=nil;
    end;
  finally
    ENContragentObj.Free;
  end;
end;

procedure TfrmENContragentShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENContragentShow.actFilterExecute(Sender: TObject);
begin
{frmENContragentFilterEdit:=TfrmENContragentFilterEdit.Create(Application, dsInsert);
  try
    ENContragentFilterObj := ENContragentFilter.Create;
    SetNullIntProps(ENContragentFilterObj);
    SetNullXSProps(ENContragentFilterObj);

    if frmENContragentFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENContragentFilter.Create;
      FilterObject := ENContragentFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENContragentFilterEdit.Free;
    frmENContragentFilterEdit:=nil;
  end;}
end;

procedure TfrmENContragentShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.