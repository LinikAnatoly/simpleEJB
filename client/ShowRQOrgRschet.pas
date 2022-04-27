
unit ShowRQOrgRschet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrgRschetController, AdvObj ;


type
  TfrmRQOrgRschetShow = class(TChildForm)  
  HTTPRIORQOrgRschet: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrgRschet: TAdvStringGrid;
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
procedure sgRQOrgRschetTopLeftChanged(Sender: TObject);
procedure sgRQOrgRschetDblClick(Sender: TObject);
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
 frmRQOrgRschetShow : TfrmRQOrgRschetShow;
 // RQOrgRschetObj: RQOrgRschet;
 // RQOrgRschetFilterObj: RQOrgRschetFilter;
  
  
implementation

uses Main, EditRQOrgRschet, EditRQOrgRschetFilter;


{$R *.dfm}

var
  //frmRQOrgRschetShow : TfrmRQOrgRschetShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrgRschetHeaders: array [1..7] of String =
        ( 'Код'
          ,'Р/рахунок'
          ,'Назва банку'
          ,'МФО банку'
          ,'ид банка'
          ,'Код валюты'
          ,'Валюта'
        );
   

procedure TfrmRQOrgRschetShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrgRschetShow:=nil;
    inherited;
  end;


procedure TfrmRQOrgRschetShow.FormShow(Sender: TObject);
var
  TempRQOrgRschet: RQOrgRschetControllerSoapPort;
  i: Integer;
  //RQOrgRschetList: OrgRschetBankList;
  RQOrgRschetBankList: RQOrgRschetShortList;

  begin
  SetGridHeaders(RQOrgRschetHeaders, sgRQOrgRschet.ColumnHeaders);
  ColCount:=100;
  TempRQOrgRschet :=  HTTPRIORQOrgRschet as RQOrgRschetControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrgRschetFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrgRschetBankList := TempRQOrgRschet.getOrgRschetBankList(RQOrgRschetFilter(FilterObject),0,ColCount);

  LastCount:=High(RQOrgRschetBankList.list);

  if LastCount > -1 then
     sgRQOrgRschet.RowCount:=LastCount+2
  else
     sgRQOrgRschet.RowCount:=2;

   with sgRQOrgRschet do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if RQOrgRschetBankList.list[i].id <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RQOrgRschetBankList.list[i].id)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := RQOrgRschetBankList.list[i].rschet;
        Cells[2,i+1] := RQOrgRschetBankList.list[i].bankName;
        Cells[3,i+1] := RQOrgRschetBankList.list[i].mfo;
        Cells[4,i+1] := IntToStr(RQOrgRschetBankList.list[i].bankId);
        Cells[5,i+1] := RQOrgRschetBankList.list[i].currency_code;
        Cells[6,i+1] := RQOrgRschetBankList.list[i].currency_short_name;

        LastRow:=i+1;
        sgRQOrgRschet.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrgRschet.Row:=1;
end;

procedure TfrmRQOrgRschetShow.sgRQOrgRschetTopLeftChanged(Sender: TObject);
var
  TempRQOrgRschet: RQOrgRschetControllerSoapPort;
  i,CurrentRow: Integer;
  //RQOrgRschetList: RQOrgRschetShortList;
  RQOrgRschetBankList: RQOrgRschetShortList;
begin
  if LastCount < 99 then Exit;
  if (sgRQOrgRschet.TopRow + sgRQOrgRschet.VisibleRowCount) = ColCount then
  begin
    TempRQOrgRschet := HTTPRIORQOrgRschet as RQOrgRschetControllerSoapPort;

    CurrentRow := sgRQOrgRschet.RowCount;

    if FilterObject = nil then
    begin
       FilterObject := RQOrgRschetFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
    end;

    RQOrgRschetBankList := TempRQOrgRschet.getOrgRschetBankList(RQOrgRschetFilter(FilterObject), ColCount-1, 100);

    sgRQOrgRschet.RowCount := sgRQOrgRschet.RowCount+100;

    LastCount := High(RQOrgRschetBankList.list);
  with sgRQOrgRschet do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if RQOrgRschetBankList.list[i].id <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(RQOrgRschetBankList.list[i].id)
        else
          Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQOrgRschetBankList.list[i].rschet;
        Cells[2,i+CurrentRow] := RQOrgRschetBankList.list[i].bankName;
        Cells[3,i+CurrentRow] := RQOrgRschetBankList.list[i].mfo;
        Cells[4,i+CurrentRow] := IntToStr(RQOrgRschetBankList.list[i].bankId);
        Cells[5,i+CurrentRow] := RQOrgRschetBankList.list[i].currency_code;
        Cells[6,i+CurrentRow] := RQOrgRschetBankList.list[i].currency_short_name;

        LastRow:=i+CurrentRow;
      end;

   ColCount:=ColCount+100;
   sgRQOrgRschet.Row:=CurrentRow-5;
   sgRQOrgRschet.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrgRschetShow.sgRQOrgRschetDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrgRschet,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrgRschetShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrgRschet.RowCount-1 do
   for j:=0 to sgRQOrgRschet.ColCount-1 do
     sgRQOrgRschet.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrgRschetShow.actViewExecute(Sender: TObject);
//Var TempRQOrgRschet: RQOrgRschetControllerSoapPort;
begin
{
 TempRQOrgRschet := HTTPRIORQOrgRschet as RQOrgRschetControllerSoapPort;
   try
     RQOrgRschetObj := TempRQOrgRschet.getObject(StrToInt(sgRQOrgRschet.Cells[0,sgRQOrgRschet.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrgRschetEdit:=TfrmRQOrgRschetEdit.Create(Application, dsView);
  try
    frmRQOrgRschetEdit.ShowModal;
  finally
    frmRQOrgRschetEdit.Free;
    frmRQOrgRschetEdit:=nil;
  end;
}
end;

procedure TfrmRQOrgRschetShow.actEditExecute(Sender: TObject);
Var TempRQOrgRschet: RQOrgRschetControllerSoapPort;
begin
  frmRQOrgRschetEdit := TfrmRQOrgRschetEdit.Create(Application, dsEdit);
  try
    TempRQOrgRschet := HTTPRIORQOrgRschet as RQOrgRschetControllerSoapPort;

    try
      frmRQOrgRschetEdit.RQOrgRschetObj := TempRQOrgRschet.getObject(StrToInt(sgRQOrgRschet.Cells[0, sgRQOrgRschet.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmRQOrgRschetEdit.ShowModal = mrOk then
    begin
      //TempRQOrgRschet.save(RQOrgRschetObj);
      UpdateGrid(Sender);
    end;
  finally
    frmRQOrgRschetEdit.Free;
    frmRQOrgRschetEdit := nil;
  end;
end;

procedure TfrmRQOrgRschetShow.actDeleteExecute(Sender: TObject);
Var TempRQOrgRschet: RQOrgRschetControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrgRschet := HTTPRIORQOrgRschet as RQOrgRschetControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrgRschet.Cells[0,sgRQOrgRschet.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Довідник р/р підприемств) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrgRschet.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrgRschetShow.actInsertExecute(Sender: TObject);
Var TempRQOrgRschet: RQOrgRschetControllerSoapPort;
begin
  TempRQOrgRschet := HTTPRIORQOrgRschet as RQOrgRschetControllerSoapPort;

  try
    frmRQOrgRschetEdit := TfrmRQOrgRschetEdit.Create(Application, dsInsert);
    try
      frmRQOrgRschetEdit.RQOrgRschetObj := RQOrgRschet.Create;
      SetNullIntProps(frmRQOrgRschetEdit.RQOrgRschetObj);
      SetNullXSProps(frmRQOrgRschetEdit.RQOrgRschetObj);

      if frmRQOrgRschetEdit.ShowModal = mrOk then
      begin
        if frmRQOrgRschetEdit.RQOrgRschetObj <> nil then
            //TempRQOrgRschet.add(RQOrgRschetObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrgRschetEdit.Free;
      frmRQOrgRschetEdit := nil;
    end;
  finally
    //RQOrgRschetObj.Free;
  end;
end;

procedure TfrmRQOrgRschetShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrgRschetShow.actFilterExecute(Sender: TObject);
begin
frmRQOrgRschetFilterEdit:=TfrmRQOrgRschetFilterEdit.Create(Application, dsEdit);
  try
    RQOrgRschetFilterObj := RQOrgRschetFilter.Create;
    SetNullIntProps(RQOrgRschetFilterObj);
    SetNullXSProps(RQOrgRschetFilterObj);

    if frmRQOrgRschetFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrgRschetFilter.Create;
      RQOrgRschetFilterObj.orgId := RQOrgRschetFilter(FilterObject).orgId;
      FilterObject := RQOrgRschetFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrgRschetFilterEdit.Free;
    frmRQOrgRschetFilterEdit:=nil;
  end;
end;

procedure TfrmRQOrgRschetShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;


end.