unit ShowENSO2NodeOthers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, Rio, SOAPHTTPClient,
  ImgList,Grids, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENServicesObjectController, AdvObj, ENSO2NodeController, InvokeRegistry,
  ComCtrls, ToolWin;

type
  TfrmENSO2NodeOthersShow = class(TChildForm)
    ActionList1: TActionList;
    actView: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    HTTPRIOENServicesObject: THTTPRIO;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    sgENSO2NodeOthers: TAdvStringGrid;
    ToolBar1: TToolBar;
    ToolButton11: TToolButton;
    HTTPRIOENSO2Node: THTTPRIO;
    ToolButton1: TToolButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure sgENSO2NodeOthersDblClick(Sender: TObject);
  procedure actViewExecute(Sender: TObject);
  procedure actUpdateExecute(Sender: TObject);

  private
    { Private declarations }
    isFiltered  : boolean;
    priconnections : Boolean;
    servObjCode: Integer;
  public
    { Public declarations }
    procedure UpdateGrid(Sender: TObject);
  end;

var
  frmENSO2NodeOthersShow: TfrmENSO2NodeOthersShow;
  servicesobjectrefcode: Integer;

implementation

{$R *.dfm}

uses
     EditENServicesConnection;

var
  ColCount, LastCount, nodeLastCount: Integer;
  LastRow: Integer = 1;

  ENSO2NodeHeaders: array [1..33] of String =
        ( 'Код'
          ,'код об''єкта'
          ,'назва об''єкта'
          ,'потужність'
          ,'потужність існуюча'
          ,'точка забезп.потужн.ТУ'
          ,'точка приєднання ТУ'
          ,'Роботи безпосередньо по приєднанню'
          ,'опис точки'
          ,'приймає участь у розрахунку резерва'
          ,'Тип точки'
          ,'Номер\дата договору'
          ,'Найменування договору'
          ,'Статус договору'
          ,'об''єкт приэднання'
          ,'адреса об''єкту приэднання'
          ,'напруга'
          ,'напруга існуюча'
          ,'підрозділ'
          ,'№ТУ'
          ,'дата ТУ'
          ,'тип приєднання'
          ,'фактична дата підключення'
          ,'назва Ф04'
          ,'назва ТП10(6)/04'
          ,'назва Ф10(6)'
          ,'назва ПС35/10(6)'
          ,'назва Ф35'
          ,'назва ПС150'
          ,'назва Ф150'
          ,'Користувач, який змінив запис'
          ,'Дата зміни'
          ,'servicesobjectCode'
        );


procedure TfrmENSO2NodeOthersShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (FormMode = fmChild) then
  begin
    frmENSO2NodeOthersShow := nil;
  end;
   inherited;
end;

procedure TfrmENSO2NodeOthersShow.FormShow(Sender: TObject);
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
  nodeCode, i, nodeColCount: Integer;
  ENSO2NodeList: ENSO2NodeShortList;
  so2nodeFilter : ENSO2NodeFilter;
  condition: String;
begin

  priconnections := true;

  ClearGrid(sgENSO2NodeOthers);
  SetGridHeaders(ENSO2NodeHeaders, sgENSO2NodeOthers.ColumnHeaders);
  TempENSO2Node :=  HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;
   {
   try
    nodeCode:=CCNodeExtShort(MainTree.Selected.Data).code;
   except
    on EConvertError do Exit;
   end;   }

   AddCondition(condition,' ENSO2NODE.CCNODECODE in (select nodewithallchildren_normal(                '+
             '              (select   ( select ccCode                                                        '+
             '  from dblink(  '+QuotedStr(' dbname=callcenter port=5432 host=10.77.11.180 user=read password=read')+',  '+
             '  format(''select q.code from ccnode q where q.code in (select nodewithallparents_normal(%s)) '+
             '         and q.nodetypecode in (2,4,6) and nodetypecode<=         '+
             '         (select nn.nodetypecode from ccnode nn where nn.code=%s) '+
             '         order by q.nodetypecode desc limit 1'',s2n.ccnodecode, s2n.ccnodecode)) '+
             ' as  (ccCode double precision) ) as subNodeCode '+
             ' from enso2node s2n '+
             ' where s2n.servicesobjectcode = '+IntToStr(servicesobjectrefcode)+' limit 1)))');

   so2nodeFilter := ENSO2NodeFilter.Create;
   SetNullIntProps(so2nodeFilter);
   SetNullXSProps(so2nodeFilter);
   so2nodeFilter.conditionSQL := condition;


  ENSO2NodeList := TempENSO2Node.getScrollableFilteredList(so2nodeFilter,0,-1);
  nodeLastCount:=High(ENSO2NodeList.list);

  if nodeLastCount > -1 then
     sgENSO2NodeOthers.RowCount:=nodeLastCount+2
  else
     sgENSO2NodeOthers.RowCount:=2;

   with sgENSO2NodeOthers do
    for i:=0 to nodeLastCount do
      begin

        Application.ProcessMessages;
        if ENSO2NodeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSO2NodeList.list[i].code)
        else
        Cells[0,i+1] := '';

        AddCheckBox(1, i+1, false, false);

        if ENSO2NodeList.list[i].ccNodeCode = Low(Integer) then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := IntToStr(ENSO2NodeList.list[i].ccNodeCode);

          Cells[2,i+1] := ENSO2NodeList.list[i].ccelementdataname;

          if ENSO2NodeList.list[i].power <> nil then
          Cells[3,i+1] := ENSO2NodeList.list[i].power.DecimalString
          else
          Cells[3,i+1] := '';

          if ENSO2NodeList.list[i].tc_currpower <> nil then
          Cells[4,i+1] := ENSO2NodeList.list[i].tc_currpower.DecimalString
          else
          Cells[4,i+1] := '';

          Cells[5,i+1] := ENSO2NodeList.list[i].tc_conpowpoint;         //19
          Cells[6,i+1] := ENSO2NodeList.list[i].tc_conpowplaces;       //20
          Cells[7,i+1] := ENSO2NodeList.list[i].work_directly_on_joining;

          Cells[8,i+1] := ENSO2NodeList.list[i].description;

          if (ENSO2NodeList.list[i].isCalc = 1) then
          Cells[9,i+1] := 'Так'
        else
          Cells[9,i+1] := '';

          Cells[10,i+1] := ENSO2NodeList.list[i].so2nodeTypeName;

          Cells[11,i+1] := ENSO2NodeList.list[i].servicesobjectContractNumberServices + '\' +
                          ENSO2NodeList.list[i].servicesobjectContractNumber + ' від ' +
                          XSDate2String(ENSO2NodeList.list[i].servicesobjectContractDateServices);

          Cells[12,i+1] := ENSO2NodeList.list[i].servicesobjectContragentName;
          //Статус договору
          Cells[13,i+1] := ENSO2NodeList.list[i].servicesobjectContractStatusRefName;

          Cells[14,i+1] := ENSO2NodeList.list[i].tc_building;
          Cells[15,i+1] := ENSO2NodeList.list[i].tc_address;

          if ENSO2NodeList.list[i].tc_servvoltage <> nil then
          Cells[16,i+1] := ENSO2NodeList.list[i].tc_servvoltage.DecimalString
          else
          Cells[16,i+1] := '';

          if ENSO2NodeList.list[i].tc_currvoltage <> nil then
          Cells[17,i+1] := ENSO2NodeList.list[i].tc_currvoltage.DecimalString
          else
          Cells[17,i+1] := '';

          Cells[18,i+1] := ENSO2NodeList.list[i].dep_name;
          Cells[19,i+1] := ENSO2NodeList.list[i].tc_number;
          if ENSO2NodeList.list[i].tc_dategen <> nil then
            Cells[20,i+1] := XSDate2String(ENSO2NodeList.list[i].tc_dategen)
          else
            Cells[20,i+1] := '';
          Cells[21,i+1] := ENSO2NodeList.list[i].connectionkindname;
          if ENSO2NodeList.list[i].fact_conn_date <> nil then
            Cells[22,i+1] := XSDate2String(ENSO2NodeList.list[i].fact_conn_date)
          else
            Cells[22,i+1] := '';
          Cells[23,i+1] := ENSO2NodeList.list[i].f04;
          Cells[24,i+1] := ENSO2NodeList.list[i].s10;
          Cells[25,i+1] := ENSO2NodeList.list[i].f10;
          Cells[26,i+1] := ENSO2NodeList.list[i].s35;
          Cells[27,i+1] := ENSO2NodeList.list[i].f35;
          Cells[28,i+1] := ENSO2NodeList.list[i].s150;
          Cells[29,i+1] := ENSO2NodeList.list[i].f150;

         Cells[30,i+1] := ENSO2NodeList.list[i].userGen;

        if ENSO2NodeList.list[i].dateEdit = nil then
          Cells[31,i+1] := ''
        else
          Cells[31,i+1] := XSDateTimeWithDate2String(ENSO2NodeList.list[i].dateEdit);
        Cells[32,i+1] := IntToStr(ENSO2NodeList.list[i].servicesobjectCode);

        Objects[0,i+1] := TObject(ENSO2NodeList.list[i].servicesobjectCode);

        LastRow:=i+1;
        sgENSO2NodeOthers.RowCount:=LastRow+1;

      end;

    nodeColCount:=nodeColCount+1;
    sgENSO2NodeOthers.Row:=1;
end;

procedure TfrmENSO2NodeOthersShow.sgENSO2NodeOthersDblClick(Sender: TObject);
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try
     // servObjCode := StrToInt(GetReturnValue(sgENServicesObject, 0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSO2NodeOthersShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSO2NodeOthers.RowCount-1 do
   for j:=0 to sgENSO2NodeOthers.ColCount-1 do
     sgENSO2NodeOthers.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSO2NodeOthersShow.actViewExecute(Sender: TObject);
Var TempENServicesCalculation: ENServicesObjectControllerSoapPort;
begin
 TempENServicesCalculation := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  try
     ENServicesConnectionObj := TempENServicesCalculation.getObject(StrToInt(sgENSO2NodeOthers.Cells[32,sgENSO2NodeOthers.Row]));
   except
   on EConvertError do Exit;
  end;

  frmENServicesConnectionEdit := TfrmENServicesConnectionEdit.Create(Application, dsView);
  if (priconnections)
    then frmENServicesConnectionEdit.priconnections := True;

  try
    frmENServicesConnectionEdit.ShowModal;
  finally
    frmENServicesConnectionEdit.Free;
    frmENServicesConnectionEdit:=nil;
  end;
end;

procedure TfrmENSO2NodeOthersShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;

end.
