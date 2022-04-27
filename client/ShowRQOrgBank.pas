
unit ShowRQOrgBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrgBankController, AdvObj ;


type
  TfrmRQOrgBankShow = class(TChildForm)  
  HTTPRIORQOrgBank: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrgBank: TAdvStringGrid;
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
procedure sgRQOrgBankTopLeftChanged(Sender: TObject);
procedure sgRQOrgBankDblClick(Sender: TObject);
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
  frmRQOrgBankShow : TfrmRQOrgBankShow;
 // RQOrgBankObj: RQOrgBank;
 // RQOrgBankFilterObj: RQOrgBankFilter;
  
  
implementation

uses Main, EditRQOrgBank, EditRQOrgBankFilter;


{$R *.dfm}

var
  //frmRQOrgBankShow : TfrmRQOrgBankShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrgBankHeaders: array [1..4] of String =
        ( 'Код'
          ,'Код з ФК'
          ,'МФО'
          ,'Назва'
        );
   

procedure TfrmRQOrgBankShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrgBankShow:=nil;
    inherited;
  end;


procedure TfrmRQOrgBankShow.FormShow(Sender: TObject);
var
  TempRQOrgBank: RQOrgBankControllerSoapPort;
  i: Integer;
  RQOrgBankList: RQOrgBankShortList;
begin
  SetGridHeaders(RQOrgBankHeaders, sgRQOrgBank.ColumnHeaders);

  ColCount:=100;

  TempRQOrgBank := HTTPRIORQOrgBank as RQOrgBankControllerSoapPort;

  DisableActions([actInsert, actEdit, actDelete]);

  if FilterObject = nil then
  begin
     FilterObject := RQOrgBankFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrgBankList := TempRQOrgBank.getScrollableFilteredList(RQOrgBankFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrgBankList.list);

  if LastCount > -1 then
     sgRQOrgBank.RowCount:=LastCount+2
  else
     sgRQOrgBank.RowCount:=2;

   with sgRQOrgBank do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrgBankList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrgBankList.list[i].code)
        else
        Cells[0,i+1] := '';
        if RQOrgBankList.list[i].id = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(RQOrgBankList.list[i].id);
        Cells[2,i+1] := RQOrgBankList.list[i].mfo;
        Cells[3,i+1] := RQOrgBankList.list[i].name;
        LastRow:=i+1;
        sgRQOrgBank.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrgBank.Row:=1;
end;

procedure TfrmRQOrgBankShow.sgRQOrgBankTopLeftChanged(Sender: TObject);
var
  TempRQOrgBank: RQOrgBankControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrgBankList: RQOrgBankShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrgBank.TopRow + sgRQOrgBank.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrgBank :=  HTTPRIORQOrgBank as RQOrgBankControllerSoapPort;
      CurrentRow:=sgRQOrgBank.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrgBankFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrgBankList := TempRQOrgBank.getScrollableFilteredList(RQOrgBankFilter(FilterObject),ColCount-1, 100);



  sgRQOrgBank.RowCount:=sgRQOrgBank.RowCount+100;
  LastCount:=High(RQOrgBankList.list);
  with sgRQOrgBank do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrgBankList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrgBankList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if RQOrgBankList.list[i].id = Low(Integer) then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := IntToStr(RQOrgBankList.list[i].id);
        Cells[2,i+CurrentRow] := RQOrgBankList.list[i].mfo;
        Cells[3,i+CurrentRow] := RQOrgBankList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrgBank.Row:=CurrentRow-5;
   sgRQOrgBank.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrgBankShow.sgRQOrgBankDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrgBank,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrgBankShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrgBank.RowCount-1 do
   for j:=0 to sgRQOrgBank.ColCount-1 do
     sgRQOrgBank.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrgBankShow.actViewExecute(Sender: TObject);
//Var TempRQOrgBank: RQOrgBankControllerSoapPort;
begin
{
 TempRQOrgBank := HTTPRIORQOrgBank as RQOrgBankControllerSoapPort;
   try
     RQOrgBankObj := TempRQOrgBank.getObject(StrToInt(sgRQOrgBank.Cells[0,sgRQOrgBank.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrgBankEdit:=TfrmRQOrgBankEdit.Create(Application, dsView);
  try
    frmRQOrgBankEdit.ShowModal;
  finally
    frmRQOrgBankEdit.Free;
    frmRQOrgBankEdit:=nil;
  end;
}
end;

procedure TfrmRQOrgBankShow.actEditExecute(Sender: TObject);
Var TempRQOrgBank: RQOrgBankControllerSoapPort;
begin
 TempRQOrgBank := HTTPRIORQOrgBank as RQOrgBankControllerSoapPort;
   try
     RQOrgBankObj := TempRQOrgBank.getObject(StrToInt(sgRQOrgBank.Cells[0,sgRQOrgBank.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrgBankEdit:=TfrmRQOrgBankEdit.Create(Application, dsEdit);
  try
    if frmRQOrgBankEdit.ShowModal= mrOk then
      begin
        //TempRQOrgBank.save(RQOrgBankObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrgBankEdit.Free;
    frmRQOrgBankEdit:=nil;
  end;
end;

procedure TfrmRQOrgBankShow.actDeleteExecute(Sender: TObject);
Var TempRQOrgBank: RQOrgBankControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrgBank := HTTPRIORQOrgBank as RQOrgBankControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrgBank.Cells[0,sgRQOrgBank.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Довідник банків) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrgBank.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrgBankShow.actInsertExecute(Sender: TObject);
Var TempRQOrgBank: RQOrgBankControllerSoapPort;
begin
  TempRQOrgBank := HTTPRIORQOrgBank as RQOrgBankControllerSoapPort;
  RQOrgBankObj:=RQOrgBank.Create;



  try
    frmRQOrgBankEdit:=TfrmRQOrgBankEdit.Create(Application, dsInsert);
    try
      if frmRQOrgBankEdit.ShowModal = mrOk then
      begin
        if RQOrgBankObj<>nil then
            //TempRQOrgBank.add(RQOrgBankObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrgBankEdit.Free;
      frmRQOrgBankEdit:=nil;
    end;
  finally
    RQOrgBankObj.Free;
  end;
end;

procedure TfrmRQOrgBankShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrgBankShow.actFilterExecute(Sender: TObject);
begin
  frmRQOrgBankFilterEdit := TfrmRQOrgBankFilterEdit.Create(Application, dsEdit);
  try
    RQOrgBankFilterObj := RQOrgBankFilter.Create;
    SetNullIntProps(RQOrgBankFilterObj);
    SetNullXSProps(RQOrgBankFilterObj);

    if frmRQOrgBankFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrgBankFilter.Create;
      FilterObject := RQOrgBankFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrgBankFilterEdit.Free;
    frmRQOrgBankFilterEdit := nil;
  end;
end;

procedure TfrmRQOrgBankShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.