
unit ShowRQOrgEmails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrgEmailsController, AdvObj ;


type
  TfrmRQOrgEmailsShow = class(TChildForm)  
  HTTPRIORQOrgEmails: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrgEmails: TAdvStringGrid;
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
procedure sgRQOrgEmailsTopLeftChanged(Sender: TObject);
procedure sgRQOrgEmailsDblClick(Sender: TObject);
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
 frmRQOrgEmailsShow : TfrmRQOrgEmailsShow;
 // RQOrgEmailsObj: RQOrgEmails;
 // RQOrgEmailsFilterObj: RQOrgEmailsFilter;
  
  
implementation

uses Main, EditRQOrgEmails, EditRQOrgEmailsFilter;


{$R *.dfm}

var
  //frmRQOrgEmailsShow : TfrmRQOrgEmailsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrgEmailsHeaders: array [1..7] of String =
        ( 'Код'
          ,'E-mail постачальника'
          ,'Примітка'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmRQOrgEmailsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrgEmailsShow:=nil;
    inherited;
  end;


procedure TfrmRQOrgEmailsShow.FormShow(Sender: TObject);
var
  TempRQOrgEmails: RQOrgEmailsControllerSoapPort;
  i: Integer;
  RQOrgEmailsList: RQOrgEmailsShortList;
  begin
  SetGridHeaders(RQOrgEmailsHeaders, sgRQOrgEmails.ColumnHeaders);
  ColCount:=100;
  TempRQOrgEmails :=  HTTPRIORQOrgEmails as RQOrgEmailsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrgEmailsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrgEmailsList := TempRQOrgEmails.getScrollableFilteredList(RQOrgEmailsFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrgEmailsList.list);

  if LastCount > -1 then
     sgRQOrgEmails.RowCount:=LastCount+2
  else
     sgRQOrgEmails.RowCount:=2;

   with sgRQOrgEmails do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrgEmailsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrgEmailsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQOrgEmailsList.list[i].email;
        Cells[2,i+1] := RQOrgEmailsList.list[i].commentGen;
        Cells[3,i+1] := RQOrgEmailsList.list[i].userAdd;
        if RQOrgEmailsList.list[i].dateAdd = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(RQOrgEmailsList.list[i].dateAdd);
        Cells[5,i+1] := RQOrgEmailsList.list[i].userGen;
        if RQOrgEmailsList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(RQOrgEmailsList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQOrgEmails.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrgEmails.Row:=1;
end;

procedure TfrmRQOrgEmailsShow.sgRQOrgEmailsTopLeftChanged(Sender: TObject);
var
  TempRQOrgEmails: RQOrgEmailsControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrgEmailsList: RQOrgEmailsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrgEmails.TopRow + sgRQOrgEmails.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrgEmails :=  HTTPRIORQOrgEmails as RQOrgEmailsControllerSoapPort;
      CurrentRow:=sgRQOrgEmails.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrgEmailsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrgEmailsList := TempRQOrgEmails.getScrollableFilteredList(RQOrgEmailsFilter(FilterObject),ColCount-1, 100);



  sgRQOrgEmails.RowCount:=sgRQOrgEmails.RowCount+100;
  LastCount:=High(RQOrgEmailsList.list);
  with sgRQOrgEmails do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrgEmailsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrgEmailsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQOrgEmailsList.list[i].email;
        Cells[2,i+CurrentRow] := RQOrgEmailsList.list[i].commentGen;
        Cells[3,i+CurrentRow] := RQOrgEmailsList.list[i].userAdd;
        if RQOrgEmailsList.list[i].dateAdd = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(RQOrgEmailsList.list[i].dateAdd);		  
        Cells[5,i+CurrentRow] := RQOrgEmailsList.list[i].userGen;
        if RQOrgEmailsList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDateTimeWithDate2String(RQOrgEmailsList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrgEmails.Row:=CurrentRow-5;
   sgRQOrgEmails.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrgEmailsShow.sgRQOrgEmailsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrgEmails,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrgEmailsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrgEmails.RowCount-1 do
   for j:=0 to sgRQOrgEmails.ColCount-1 do
     sgRQOrgEmails.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrgEmailsShow.actViewExecute(Sender: TObject);
Var TempRQOrgEmails: RQOrgEmailsControllerSoapPort;
begin
 TempRQOrgEmails := HTTPRIORQOrgEmails as RQOrgEmailsControllerSoapPort;
   try
     RQOrgEmailsObj := TempRQOrgEmails.getObject(StrToInt(sgRQOrgEmails.Cells[0,sgRQOrgEmails.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrgEmailsEdit:=TfrmRQOrgEmailsEdit.Create(Application, dsView);
  try
    frmRQOrgEmailsEdit.ShowModal;
  finally
    frmRQOrgEmailsEdit.Free;
    frmRQOrgEmailsEdit:=nil;
  end;
end;

procedure TfrmRQOrgEmailsShow.actEditExecute(Sender: TObject);
Var TempRQOrgEmails: RQOrgEmailsControllerSoapPort;
begin
 TempRQOrgEmails := HTTPRIORQOrgEmails as RQOrgEmailsControllerSoapPort;
   try
     RQOrgEmailsObj := TempRQOrgEmails.getObject(StrToInt(sgRQOrgEmails.Cells[0,sgRQOrgEmails.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrgEmailsEdit:=TfrmRQOrgEmailsEdit.Create(Application, dsEdit);
  try
    if frmRQOrgEmailsEdit.ShowModal= mrOk then
      begin
        //TempRQOrgEmails.save(RQOrgEmailsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrgEmailsEdit.Free;
    frmRQOrgEmailsEdit:=nil;
  end;
end;

procedure TfrmRQOrgEmailsShow.actDeleteExecute(Sender: TObject);
Var TempRQOrgEmails: RQOrgEmailsControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrgEmails := HTTPRIORQOrgEmails as RQOrgEmailsControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrgEmails.Cells[0,sgRQOrgEmails.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (E-mail`и постачальників) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrgEmails.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrgEmailsShow.actInsertExecute(Sender: TObject);
// Var TempRQOrgEmails: RQOrgEmailsControllerSoapPort; 
begin
  // TempRQOrgEmails := HTTPRIORQOrgEmails as RQOrgEmailsControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQOrgEmailsObj:=RQOrgEmails.Create;

   //RQOrgEmailsObj.dateAdd:= TXSDateTime.Create;
   
   //RQOrgEmailsObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmRQOrgEmailsEdit:=TfrmRQOrgEmailsEdit.Create(Application, dsInsert);
    try
      if frmRQOrgEmailsEdit.ShowModal = mrOk then
      begin
        if RQOrgEmailsObj<>nil then
            //TempRQOrgEmails.add(RQOrgEmailsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrgEmailsEdit.Free;
      frmRQOrgEmailsEdit:=nil;
    end;
  finally
    RQOrgEmailsObj.Free;
  end;
end;

procedure TfrmRQOrgEmailsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrgEmailsShow.actFilterExecute(Sender: TObject);
begin
{frmRQOrgEmailsFilterEdit:=TfrmRQOrgEmailsFilterEdit.Create(Application, dsInsert);
  try
    RQOrgEmailsFilterObj := RQOrgEmailsFilter.Create;
    SetNullIntProps(RQOrgEmailsFilterObj);
    SetNullXSProps(RQOrgEmailsFilterObj);

    if frmRQOrgEmailsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrgEmailsFilter.Create;
      FilterObject := RQOrgEmailsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrgEmailsFilterEdit.Free;
    frmRQOrgEmailsFilterEdit:=nil;
  end;}
end;

procedure TfrmRQOrgEmailsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.