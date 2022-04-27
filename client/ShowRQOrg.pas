
unit ShowRQOrg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrgController, AdvObj ;


type
  TfrmRQOrgShow = class(TChildForm)  
  HTTPRIORQOrg: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrg: TAdvStringGrid;
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
procedure sgRQOrgTopLeftChanged(Sender: TObject);
procedure sgRQOrgDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   ShowFilter: Boolean;
   contrAgentType : Integer;
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmRQOrgShow : TfrmRQOrgShow;
 // RQOrgObj: RQOrg;
 // RQOrgFilterObj: RQOrgFilter;
  
  
implementation

uses Main, EditRQOrg, EditRQOrgFilter, DMReportsUnit, ENConsts;


{$R *.dfm}

var
  //frmRQOrgShow : TfrmRQOrgShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrgHeaders: array [1..8] of String =
        ( 'Код'
          ,'Найменування'
          ,'ОКПО'
          ,'Налоговий номер'
          ,'Свідоцтво'
          ,'Адреса'
          ,'Телефон'
          ,'Примітка'
        );


procedure TfrmRQOrgShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrgShow:=nil;
    inherited;
  end;


procedure TfrmRQOrgShow.FormShow(Sender: TObject);
var
  TempRQOrg: RQOrgControllerSoapPort;
  i: Integer;
  RQOrgList: RQOrgShortList;
begin
  SetGridHeaders(RQOrgHeaders, sgRQOrg.ColumnHeaders);
  ColCount:=100;
  
  TempRQOrg := HTTPRIORQOrg as RQOrgControllerSoapPort;

  DisableActions([{actInsert, actEdit, }actDelete]);

  // ??? 24.04.2017 Нафига оно надо?
  //RQOrgObj:=RQOrg.Create;
  //RQOrgObj.date_nalogform := TXSDate.Create;

  if FilterObject = nil then
  begin
     FilterObject := RQOrgFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrgFilter(FilterObject).type_ := IntToStr(contrAgentType);

  if ShowFilter then
  begin
    actFilterExecute(Sender);
    Exit;
  end;

  //RQOrgList := TempRQOrg.getScrollableFilteredList(RQOrgFilter(FilterObject),0,ColCount);

  //RQOrgList := TempRQOrg.getRQOrgList(RQOrgFilter(FilterObject),ColCount-1, 100);
  RQOrgList := TempRQOrg.getRQOrgList(RQOrgFilter(FilterObject), 0, ColCount);

  LastCount:=High(RQOrgList.list);

  if LastCount > -1 then
     sgRQOrg.RowCount:=LastCount+2
  else
     sgRQOrg.RowCount:=2;

   with sgRQOrg do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        {
        if RQOrgList.list[i].id <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RQOrgList.list[i].id)
        else if RQOrgList.list[i].axOrgId <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RQOrgList.list[i].axOrgId)
        else
          Cells[0,i+1] := '';
        }
        if RQOrgList.list[i].id <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RQOrgList.list[i].id)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := RQOrgList.list[i].name;
        Cells[2,i+1] := RQOrgList.list[i].okpo;
        Cells[3,i+1] := RQOrgList.list[i].nalog_num;
        Cells[4,i+1] := RQOrgList.list[i].svidet_num;
        Cells[5,i+1] := RQOrgList.list[i].adr;
        Cells[6,i+1] := RQOrgList.list[i].tel;
        Cells[7,i+1] := RQOrgList.list[i].Primechan;
        Cells[8,i+1] := RQOrgList.list[i].codeorg;
        Cells[9,i+1] := RQOrgList.list[i].ukr_name;
        Cells[10,i+1] := RQOrgList.list[i].country;
        Cells[11,i+1] := RQOrgList.list[i].region;
        Cells[12,i+1] := RQOrgList.list[i].ministry;
        Cells[13,i+1] := IntToStr(RQOrgList.list[i].ownership);
        Cells[14,i+1] := RQOrgList.list[i].type_;
        Cells[15,i+1] := RQOrgList.list[i].master_code;

        if RQOrgList.list[i].date_svidet <> nil then
           Cells[16,i+1] := XSDate2String(RQOrgList.list[i].date_svidet);
        if RQOrgList.list[i].likv_date <> nil then
           Cells[17,i+1] := XSDate2String(RQOrgList.list[i].likv_date);

        Cells[18,i+1] := RQOrgList.list[i].except_flag;
        Cells[19,i+1] := RQOrgList.list[i].likv_flag;
        Cells[20,i+1] := RQOrgList.list[i].budget_flag;

        if RQOrgList.list[i].date_nalogform <> nil then
           Cells[21,i+1] := XSDate2String(RQOrgList.list[i].date_nalogform);

        Cells[22,i+1] := IntToStr(RQOrgList.list[i].id_nalogform);
        Cells[23,i+1] := RQOrgList.list[i].adr_legal;

        if RQOrgList.list[i].axOrgId <> Low(Integer) then
          Cells[24,i+1] := IntToStr(RQOrgList.list[i].axOrgId)
        else
          Cells[24,i+1] := '';
        Cells[25,i+1] := RQOrgList.list[i].axOrgCode;

        LastRow:=i+1;
        sgRQOrg.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrg.Row:=1;
end;

procedure TfrmRQOrgShow.sgRQOrgTopLeftChanged(Sender: TObject);
var
  TempRQOrg: RQOrgControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrgList: RQOrgShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrg.TopRow + sgRQOrg.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrg :=  HTTPRIORQOrg as RQOrgControllerSoapPort;
      CurrentRow:=sgRQOrg.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrgFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  //RQOrgList := TempRQOrg.getScrollableFilteredList(RQOrgFilter(FilterObject),ColCount-1, 100);

  RQOrgList := TempRQOrg.getRQOrgList(RQOrgFilter(FilterObject), ColCount-1, 100);

  sgRQOrg.RowCount:=sgRQOrg.RowCount+100;
  LastCount:=High(RQOrgList.list);
  with sgRQOrg do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if RQOrgList.list[i].id <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(RQOrgList.list[i].id)
        else
          Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := RQOrgList.list[i].name;
        Cells[2,i+CurrentRow] := RQOrgList.list[i].okpo;
        Cells[3,i+CurrentRow] := RQOrgList.list[i].nalog_num;
        Cells[4,i+CurrentRow] := RQOrgList.list[i].svidet_num;
        Cells[5,i+CurrentRow] := RQOrgList.list[i].adr;
        Cells[6,i+CurrentRow] := RQOrgList.list[i].tel;
        Cells[7,i+CurrentRow] := RQOrgList.list[i].Primechan;

        Cells[8,i+CurrentRow] := RQOrgList.list[i].codeorg;
        Cells[9,i+CurrentRow] := RQOrgList.list[i].ukr_name;
        Cells[10,i+CurrentRow] := RQOrgList.list[i].country;
        Cells[11,i+CurrentRow] := RQOrgList.list[i].region;
        Cells[12,i+CurrentRow] := RQOrgList.list[i].ministry;
        Cells[13,i+CurrentRow] := IntToStr(RQOrgList.list[i].ownership);
        Cells[14,i+CurrentRow] := RQOrgList.list[i].type_;
        Cells[15,i+CurrentRow] := RQOrgList.list[i].master_code;

        if RQOrgList.list[i].date_svidet <> nil then
           Cells[16,i+CurrentRow] := XSDate2String(RQOrgList.list[i].date_svidet);
        if RQOrgList.list[i].likv_date <> nil then
           Cells[17,i+CurrentRow] := XSDate2String(RQOrgList.list[i].likv_date);

        Cells[18,i+CurrentRow] := RQOrgList.list[i].except_flag;
        Cells[19,i+CurrentRow] := RQOrgList.list[i].likv_flag;
        Cells[20,i+CurrentRow] := RQOrgList.list[i].budget_flag;

        if RQOrgList.list[i].date_nalogform <> nil then
           Cells[21,i+CurrentRow] := XSDate2String(RQOrgList.list[i].date_nalogform);

        Cells[22,i+CurrentRow] := IntToStr(RQOrgList.list[i].id_nalogform);
        Cells[23,i+CurrentRow] := RQOrgList.list[i].adr_legal;

        if RQOrgList.list[i].axOrgId <> Low(Integer) then
          Cells[24,i+CurrentRow] := IntToStr(RQOrgList.list[i].axOrgId)
        else
          Cells[24,i+CurrentRow] := '';
        Cells[25,i+CurrentRow] := RQOrgList.list[i].axOrgCode;

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrg.Row:=CurrentRow-5;
   sgRQOrg.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrgShow.sgRQOrgDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    if not DMReports.UsesMDAXData(CONFIG_USES_MDAX_CUSTOMER) then
    begin
      try
        temp:=StrToInt(GetReturnValue(sgRQOrg,0));
      except
        on EConvertError do Exit;
      end;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrgShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrg.RowCount-1 do
   for j:=0 to sgRQOrg.ColCount-1 do
     sgRQOrg.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrgShow.actViewExecute(Sender: TObject);
Var TempRQOrg: RQOrgControllerSoapPort;
begin
  frmRQOrgEdit := TfrmRQOrgEdit.Create(Application, dsView);
  try
    TempRQOrg := HTTPRIORQOrg as RQOrgControllerSoapPort;
    try
      frmRQOrgEdit.RQOrgObj := TempRQOrg.getObjectFromFK(StrToInt(sgRQOrg.Cells[0, sgRQOrg.Row]));
    except
      on EConvertError do Exit;
    end;

    frmRQOrgEdit.ShowModal;
  finally
    frmRQOrgEdit.Free;
    frmRQOrgEdit := nil;
  end;
end;

procedure TfrmRQOrgShow.actEditExecute(Sender: TObject);
Var TempRQOrg: RQOrgControllerSoapPort;
begin
  frmRQOrgEdit := TfrmRQOrgEdit.Create(Application, dsEdit);
  try
    TempRQOrg := HTTPRIORQOrg as RQOrgControllerSoapPort;
    try
      frmRQOrgEdit.RQOrgObj := TempRQOrg.getObjectFromFK(StrToInt(sgRQOrg.Cells[0, sgRQOrg.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmRQOrgEdit.ShowModal = mrOk then
    begin
      //TempRQOrg.save(RQOrgObj);
      UpdateGrid(Sender);
    end;
  finally
    frmRQOrgEdit.Free;
    frmRQOrgEdit := nil;
  end;
end;

procedure TfrmRQOrgShow.actDeleteExecute(Sender: TObject);
//Var TempRQOrg: RQOrgControllerSoapPort;
//  ObjCode: Integer;
begin
{
 TempRQOrg := HTTPRIORQOrg as RQOrgControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrg.Cells[0,sgRQOrg.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Організація (контрагенти)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrg.remove(ObjCode);
      UpdateGrid(Sender);
  end;
}
end;

procedure TfrmRQOrgShow.actInsertExecute(Sender: TObject);
//Var TempRQOrg: RQOrgControllerSoapPort;
var
  frmRQOrgEdit: TfrmRQOrgEdit;
begin
  try
    frmRQOrgEdit := TfrmRQOrgEdit.Create(Application, dsInsert);
    try
      frmRQOrgEdit.RQOrgObj := RQOrg.Create;
      SetNullIntProps(frmRQOrgEdit.RQOrgObj);
      SetNullXSProps(frmRQOrgEdit.RQOrgObj);

      if frmRQOrgEdit.ShowModal = mrOk then
      begin
        if frmRQOrgEdit.RQOrgObj <> nil then
        begin
          //TempRQOrg.add(RQOrgObj);
          //UpdateGrid(Sender);

          /////
          // После добавления фильтранем лист по коду добавленного контрагента
          // и откроем его на редактирование (чтобы сразу занести р/счета)
          if frmRQOrgEdit.RQOrgObj.codeorg <> '' then
          begin
            RQOrgFilterObj := RQOrgFilter.Create;
            SetNullIntProps(RQOrgFilterObj);
            SetNullXSProps(RQOrgFilterObj);

            RQOrgFilterObj.codeorg := frmRQOrgEdit.RQOrgObj.codeorg;

            RQOrgFilterObj.type_ := IntToStr(contrAgentType);
            FilterObject := RQOrgFilterObj;

            actUpdateExecute(Sender);
            actEditExecute(Sender);
          end
          else
            UpdateGrid(Sender);
          /////
        end;
      end;
    finally
      frmRQOrgEdit.Free;
      frmRQOrgEdit := nil;
    end;
  finally
    //RQOrgObj.Free;
  end;
end;

procedure TfrmRQOrgShow.actUpdateExecute(Sender: TObject);
begin
  ShowFilter := false;
  UpdateGrid(Sender);
end;


procedure TfrmRQOrgShow.actFilterExecute(Sender: TObject);
begin
  frmRQOrgFilterEdit:=TfrmRQOrgFilterEdit.Create(Application, dsEdit);
  try
    RQOrgFilterObj := RQOrgFilter.Create;
    SetNullIntProps(RQOrgFilterObj);
    SetNullXSProps(RQOrgFilterObj);

    if frmRQOrgFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrgFilter.Create;
      RQOrgFilterObj.type_ := IntToStr(contrAgentType);
      FilterObject := RQOrgFilterObj;

      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrgFilterEdit.Free;
    frmRQOrgFilterEdit:=nil;
  end;
end;

procedure TfrmRQOrgShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmRQOrgShow.FormCreate(Sender: TObject);
begin
  inherited;
  ShowFilter := true;
  contrAgentType := Low(Integer);
end;

end.