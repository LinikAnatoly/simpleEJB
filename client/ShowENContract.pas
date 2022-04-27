
unit ShowENContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENContractController, AdvObj ;


type
  TfrmENContractShow = class(TChildForm)  
  HTTPRIOENContract: THTTPRIO;
    ImageList1: TImageList;
    sgENContract: TAdvStringGrid;
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
procedure sgENContractTopLeftChanged(Sender: TObject);
procedure sgENContractDblClick(Sender: TObject);
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
 // ENContractObj: ENContract;
 // ENContractFilterObj: ENContractFilter;
  
  
implementation

uses Main, EditENContract, EditENContractFilter;


{$R *.dfm}

var
  //frmENContractShow : TfrmENContractShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENContractHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер договору'
          ,'Дата договору'
          ,'Дата закінчення договору'
          ,'Постачальник'  // 5
          ,'Код договору у фін.кол.'
          ,'PK договору у фін.кол.'
          ,'Пользователь внесший изменение'
          ,'Дата последнего изменения'
        );
   

procedure TfrmENContractShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENContractShow:=nil;
    inherited;
  end;


procedure TfrmENContractShow.FormShow(Sender: TObject);
var
  TempENContract: ENContractControllerSoapPort;
  i: Integer;
  ENContractList: ENContractShortList;
  begin
  SetGridHeaders(ENContractHeaders, sgENContract.ColumnHeaders);
  ColCount:=100;
  TempENContract :=  HTTPRIOENContract as ENContractControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENContractFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENContractFilter(FilterObject).orderBySQL := 'contractdate desc ';

  ENContractList := TempENContract.getScrollableFilteredList(ENContractFilter(FilterObject),0,ColCount);


  LastCount:=High(ENContractList.list);

  if LastCount > -1 then
     sgENContract.RowCount:=LastCount+2
  else
     sgENContract.RowCount:=2;

   with sgENContract do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENContractList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENContractList.list[i].code)
        else
          Cells[0,i+1] := '';

          Cells[1,i+1] := ENContractList.list[i].contractNumber;

        if ENContractList.list[i].contractDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENContractList.list[i].contractDate);

        if ENContractList.list[i].contractEndDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(ENContractList.list[i].contractEndDate);

          Cells[4,i+1] := ENContractList.list[i].orgName;

          Cells[5,i+1] := ENContractList.list[i].finDocCode;

        if ENContractList.list[i].finDocID = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(ENContractList.list[i].finDocID);

          Cells[7,i+1] := ENContractList.list[i].userGen;

        if ENContractList.list[i].dateEdit = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENContractList.list[i].dateEdit);

        LastRow:=i+1;
        sgENContract.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENContract.Row:=1;
end;

procedure TfrmENContractShow.sgENContractTopLeftChanged(Sender: TObject);
var
  TempENContract: ENContractControllerSoapPort;
  i,CurrentRow: Integer;
  ENContractList: ENContractShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENContract.TopRow + sgENContract.VisibleRowCount) = ColCount
  then
    begin
      TempENContract :=  HTTPRIOENContract as ENContractControllerSoapPort;
      CurrentRow:=sgENContract.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENContractFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENContractList := TempENContract.getScrollableFilteredList(ENContractFilter(FilterObject),ColCount-1, 100);



  sgENContract.RowCount:=sgENContract.RowCount+100;
  LastCount:=High(ENContractList.list);
  with sgENContract do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENContractList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENContractList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENContractList.list[i].contractNumber;

        if ENContractList.list[i].contractDate = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENContractList.list[i].contractDate);

        if ENContractList.list[i].contractEndDate = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENContractList.list[i].contractEndDate);

          Cells[4,i+CurrentRow] := ENContractList.list[i].orgName;

          Cells[5,i+CurrentRow] := ENContractList.list[i].finDocCode;

        if ENContractList.list[i].finDocID = Low(Integer) then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := IntToStr(ENContractList.list[i].finDocID);

        Cells[7,i+CurrentRow] := ENContractList.list[i].userGen;

        if ENContractList.list[i].dateEdit = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDate2String(ENContractList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENContract.Row:=CurrentRow-5;
   sgENContract.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENContractShow.sgENContractDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENContract,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENContractShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENContract.RowCount-1 do
   for j:=0 to sgENContract.ColCount-1 do
     sgENContract.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENContractShow.actViewExecute(Sender: TObject);
Var TempENContract: ENContractControllerSoapPort;
begin
 TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;
   try
     ENContractObj := TempENContract.getObject(StrToInt(sgENContract.Cells[0,sgENContract.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContractEdit:=TfrmENContractEdit.Create(Application, dsView);
  try
    frmENContractEdit.ShowModal;
  finally
    frmENContractEdit.Free;
    frmENContractEdit:=nil;
  end;
end;

procedure TfrmENContractShow.actEditExecute(Sender: TObject);
Var TempENContract: ENContractControllerSoapPort;
begin
 TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;
   try
     ENContractObj := TempENContract.getObject(StrToInt(sgENContract.Cells[0,sgENContract.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContractEdit:=TfrmENContractEdit.Create(Application, dsEdit);
  try
    if frmENContractEdit.ShowModal= mrOk then
      begin
        //TempENContract.save(ENContractObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENContractEdit.Free;
    frmENContractEdit:=nil;
  end;
end;

procedure TfrmENContractShow.actDeleteExecute(Sender: TObject);
Var TempENContract: ENContractControllerSoapPort;
  ObjCode: Integer;
begin
 TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;
   try
     ObjCode := StrToInt(sgENContract.Cells[0,sgENContract.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Договір) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENContract.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENContractShow.actInsertExecute(Sender: TObject);
Var TempENContract: ENContractControllerSoapPort;
begin
  TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;
  ENContractObj:=ENContract.Create;

   ENContractObj.contractDate:= TXSDate.Create;
   ENContractObj.dateEdit:= TXSDate.Create;


  try
    frmENContractEdit:=TfrmENContractEdit.Create(Application, dsInsert);
    try
      if frmENContractEdit.ShowModal = mrOk then
      begin
        if ENContractObj<>nil then
            //TempENContract.add(ENContractObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENContractEdit.Free;
      frmENContractEdit:=nil;
    end;
  finally
    ENContractObj.Free;
  end;
end;

procedure TfrmENContractShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENContractShow.actFilterExecute(Sender: TObject);
begin
frmENContractFilterEdit:=TfrmENContractFilterEdit.Create(Application, dsEdit);
  try
    ENContractFilterObj := ENContractFilter.Create;
    SetNullIntProps(ENContractFilterObj);
    SetNullXSProps(ENContractFilterObj);

    if frmENContractFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENContractFilter.Create;
      FilterObject := ENContractFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENContractFilterEdit.Free;
    frmENContractFilterEdit:=nil;
  end;
end;

procedure TfrmENContractShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.